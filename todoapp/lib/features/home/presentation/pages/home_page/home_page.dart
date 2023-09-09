// import 'dart:developer';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_state.dart';
import 'package:todoapp/features/home/presentation/pages/home_page/widgets/floating_add_button.dart';
import 'package:todoapp/services/repository_firestore.dart';

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
    return Scaffold(
      backgroundColor: const ColorScheme.light().background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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

class NoteCardElement extends StatelessWidget {
  const NoteCardElement({
    super.key,
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(note.title,
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(
                  note.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          if (note.imageUrl != null && note.imageUrl!.isNotEmpty)
            Expanded(
              flex: 1,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.transparent, Colors.black],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Image.network(
                  note.imageUrl!,
                  fit: BoxFit.cover,
                  height: 100,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
