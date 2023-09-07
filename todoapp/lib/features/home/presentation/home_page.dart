// import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:todoapp/features/home/domain/entities/location_entity.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_state.dart';
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
  void _newNoteOnPressed() {
    context.read<RepositoryFirestore>().addNote(
          NoteEntity(
            id: 'id',
            title: 'title',
            description: 'description',
            imageUrl: 'imageUrl',
            location: const LocationEntity(longtitute: 2, latitute: 3),
            date: DateTime.now(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => NotesCubit(),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              failure: (failureMessage) => Text(failureMessage),
              loaded: (notes) {
                return ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) =>
                      NoteCardList(note: notes[index]),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newNoteOnPressed,
        tooltip: 'New Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteCardList extends StatelessWidget {
  const NoteCardList({
    super.key,
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(note.title),
              const SizedBox(height: 8),
              Text(note.description),
              const SizedBox(height: 8),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: FittedBox(
            fit: BoxFit.cover,
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
                note.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
