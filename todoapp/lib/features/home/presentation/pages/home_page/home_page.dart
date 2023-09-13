import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:todoapp/features/home/presentation/pages/home_page/widgets/floating_add_button.dart';
import 'package:todoapp/features/theme/presentation/theme_bloc.dart';
import 'package:todoapp/services/repository_firestore.dart';

import 'widgets/note_card_element.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  static const String route = '/home';

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.select((ThemeBloc bloc) => bloc.state);
    return Scaffold(
      backgroundColor: backgroundColor ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              // context.read<NotesCubit>().signOut();
              // BlocProvider.of<ThemeBloc>(context)
              context.read<ThemeBloc>().add(ThemeEvent.toggle);
            },
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => NotesCubit(context.read<RepositoryFirestore>()),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              failure: (failureMessage) => Text(failureMessage),
              loaded: (notes) {
                return Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) =>
                        NoteCardElement(note: notes[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: const FloatingAddButton(),
    );
  }
}
