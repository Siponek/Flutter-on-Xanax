import 'package:flutter/material.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/add_note_page.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _newNoteOnPressed(context),
      tooltip: 'New Note',
      child: const Icon(
        Icons.add,
        color: Colors.indigoAccent,
        size: 40.0,
      ),
    );
  }

  void _newNoteOnPressed(BuildContext context) {
    Navigator.pushNamed(context, AddNotePage.route);
  }
}
