// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/pages/note_detail_page/note_detail_page.dart';
import 'package:todoapp/services/repository_firestore.dart';

class NoteCardElement extends StatelessWidget {
  const NoteCardElement({
    super.key,
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(note.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft, // Align to the left side
        child: const Padding(
          padding: EdgeInsets.only(left: 10.0), // Add some padding
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) async {
        log("Dismissed ${note.title}!");
        await context.read<RepositoryFirestore>().deleteNote(note.id);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${note.title} deleted")));
        // Remove the item from the data source.
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => NoteDetailPage(note: note))),
          );
        },
        child: SizedBox(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      note.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      softWrap: true,
                      maxLines: 1,
                    ),
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
        ),
      ),
    );
  }
}
