import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:todoapp/features/home/presentation/cubits/add_note_cubit/add_note_state.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/widgets/bottom_sheet_choose_image.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/widgets/find_location_bottom_sheet/find_location_bottom_sheet.dart';

import 'package:todoapp/services/repository_firestore.dart';

import 'widgets/add_note_floating_button.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
    required this.title,
  });

  static const String route = '/add_note';
  final String title;

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(context.read<RepositoryFirestore>()),
      child: Builder(builder: (context) {
        return BlocListener<AddNoteCubit, AddNoteState>(
          listener: (context, state) {},
          child: Scaffold(
            appBar: AppBar(title: const Text('Add Note Page')),
            floatingActionButton: AddNoteFloatingButton(formKey: _formKey),
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                    // insert a default value
                    onChanged: (value) =>
                        context.read<AddNoteCubit>().titleChanged(value),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter some title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Note text'),
                    onChanged: (value) =>
                        context.read<AddNoteCubit>().descriptionChanged(value),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter some description';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      final XFile? image =
                          await BottomSheetChooseImage.show(context);

                      if (image != null) {
                        // ignore: use_build_context_synchronously
                        context.read<AddNoteCubit>().imageChanged(image.path);
                      }
                    },
                    child: const Text('Add photo'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final PlaceDetails placeDetails =
                          await showModalBottomSheet(
                        context: context,
                        builder: (context) => const FindLocationBottomSheet(),
                      );
                      context
                          .read<AddNoteCubit>()
                          .locationChanged(placeDetails);
                    },
                    child: const Text('Add location'),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
