import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_state.dart';

class AddNoteFloatingButton extends StatelessWidget {
  const AddNoteFloatingButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return state.maybeWhen(
          saving: (_) => FloatingActionButton.extended(
            onPressed: context.read<AddNoteCubit>().addNote,
            label: const CircularProgressIndicator(),
          ),
          orElse: () => FloatingActionButton.extended(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                log('Note added');
                context.read<AddNoteCubit>().addNote();
                // log(context
                //     .read<AddNoteCubit>()
                //     .state
                //     .noteInput
                //     .toJson()
                //     .toString());
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Note', style: TextStyle(fontSize: 20)),
          ),
        );
      },
    );
  }
}
