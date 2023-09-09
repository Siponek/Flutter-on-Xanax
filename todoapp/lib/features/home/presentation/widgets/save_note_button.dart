// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todoapp/features/home/domain/entities/location_entity.dart';
// import 'package:todoapp/features/home/domain/entities/note_entity.dart';
// import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_cubit.dart';
// import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_state.dart';
// import 'package:todoapp/services/repository_firestore.dart';

// class SaveNoteButton extends StatelessWidget {
//   const SaveNoteButton({
//     super.key,
//     required this.idController,
//     required this.titleController,
//     required this.descriptionController,
//     required this.imageUrlController,
//     required this.locationController,
//     required this.dateController,
//   });

//   final TextEditingController idController;
//   final TextEditingController titleController;
//   final TextEditingController descriptionController;
//   final TextEditingController imageUrlController;
//   final TextEditingController locationController;
//   final TextEditingController dateController;

//   void _onPressed(BuildContext context, AddNoteState state) {
//     state.maybeWhen(
//       saving: (_) => null,
//       orElse: () {
//         log('Save Note button pressed');
//         // AddNoteCubit(context.read<RepositoryFirestore>()).addNote(note, date: date)
//         context.read<AddNoteCubit>().addNote(
//               NoteEntity(
//                 id: idController.text,
//                 title: titleController.text,
//                 description: descriptionController.text,
//                 imageUrl: imageUrlController.text,
//                 location: LocationEntity(
//                   latitute: double.parse(locationController.text.split(",")[0]),
//                   longtitute:
//                       double.parse(locationController.text.split(",")[1]),
//                 ),
//                 date: DateTime.parse(dateController.text),
//               ),
//               date: DateTime.now(),
//             );
//       },
//     );
//   }

//   Widget _child(AddNoteState state) {
//     return state.maybeWhen(
//       saving: (_) => const CircularProgressIndicator(),
//       orElse: () => const Text('Save Note'),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AddNoteCubit, AddNoteState>(
//       listener: (context, state) => state.whenOrNull(
//         success: (_) => Navigator.pop(context),
//         failure: (failureMessage, _) => const SnackBar(
//             content: Text("Could not save the note!"),
//             backgroundColor: Colors.red),
//       ),
//       builder: (context, state) {
//         return ElevatedButton(
//           onPressed: () => _onPressed(context, state),
//           child: _child(state),
//         );
//       },
//     );
//   }
// }
