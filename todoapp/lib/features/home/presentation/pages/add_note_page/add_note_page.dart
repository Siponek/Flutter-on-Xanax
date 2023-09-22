import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
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
  final TextEditingController datePickerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(context.read<RepositoryFirestore>()),
      child: Builder(builder: (context) {
        final String? imagePath =
            context.watch<AddNoteCubit>().state.noteInput.pathToImage;

        final PlaceDetails? submittedLocation =
            context.watch<AddNoteCubit>().state.noteInput.location;

        return BlocListener<AddNoteCubit, AddNoteState>(
          listener: (context, state) {},
          child: Scaffold(
            appBar: AppBar(title: const Text('Add Note Page')),
            floatingActionButton: AddNoteFloatingButton(formKey: _formKey),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    Flexible(
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration:
                            const InputDecoration(labelText: 'Note text'),
                        onChanged: (value) => context
                            .read<AddNoteCubit>()
                            .descriptionChanged(value),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    TextFormField(
                      controller: datePickerController,
                      decoration: const InputDecoration(labelText: 'Date'),
                      readOnly: true,
                      onTap: () {
                        datepickerPopup(context);
                      },
                      onChanged: (value) => context
                          .read<AddNoteCubit>()
                          .dateChanged(DateTime.parse(value)),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please pick a date';
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
                    if (imagePath != null)
                      Container(
                          height: 300,
                          child: Image.file(
                            File(imagePath),
                            fit: BoxFit.cover,
                          )),
                    TextButton(
                      onPressed: () async {
                        final PlaceDetails? placeDetails =
                            await showModalBottomSheet(
                          context: context,
                          builder: (context) => const FindLocationBottomSheet(),
                        );

                        if (placeDetails != null) {
                          context
                              .read<AddNoteCubit>()
                              .locationChanged(placeDetails);
                        }
                      },
                      child: const Text('Add location'),
                    ),
                    if (submittedLocation != null)
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: const TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 22,
                              ),
                              text:
                                  "Selected location: ${submittedLocation.name}")),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void datepickerPopup(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              setState(() => datePickerController.text =
                  DateFormat.yMMMMEEEEd().format(newDate));
            },
          ),
        ),
      ),
    );
  }
}
