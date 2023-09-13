import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/theme/presentation/theme_bloc.dart';

import 'widgets/floating_menu_button.dart';

class NoteDetailPage extends StatefulWidget {
  final NoteEntity note;
  const NoteDetailPage({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  @override
  Widget build(BuildContext context) {
    // final backgroundColor = context.select((ThemeBloc bloc) => bloc.state);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Note Detail Page',
            // style: TextStyle(color: backgroundColor ? Colors.white : Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (widget.note.imageUrl != null &&
                    widget.note.imageUrl!.isNotEmpty)
                  Image.network(widget.note.imageUrl!),
                const SizedBox(height: 8),
                Text(widget.note.title,
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(widget.note.description),
                const SizedBox(height: 8),
              ],
            )),
        floatingActionButton: const FloatingMenuButton());
  }
}
