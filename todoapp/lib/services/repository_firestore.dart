import 'dart:async';
import 'dart:developer'; // For using log

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';

class RepositoryFirestore {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  final StreamController<QuerySnapshot<Map<String, dynamic>>> _notesController;
  static const String notesKey = 'notes';

  RepositoryFirestore()
      // RepositoryFirestore({required this.db})
      // before starting the constructor
      : _notesController =
            StreamController<QuerySnapshot<Map<String, dynamic>>>.broadcast() {
    _initNotesStream();
  }

  void _initNotesStream() {
    _notesController.onCancel = () {
      log('Stream has been cancelled');
    };

    _notesController.onListen = () {
      log('Stream has a new listener');
      _startListeningToNotes();
    };
  }

  void _startListeningToNotes() {
    db.collection(notesKey).snapshots().listen(
      (data) {
        _notesController.add(data);
      },
      onError: (error, stackTrace) {
        log('Stream encountered an error: $error');
        _notesController.addError(error, stackTrace);
        _reconnectToNotes();
      },
    );
  }

  void _reconnectToNotes() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        log('Attempting to reconnect...');
        _startListeningToNotes();
      },
    );
  }

  Future<bool> addNote(NoteEntity note) async {
    try {
      final result = await db.collection(notesKey).add(note.toJson());
      log('DocumentSnapshot added with ID: ${result.id}');
      return true;
    } catch (e, stackTrace) {
      // Catch the error as 'e'
      log("Error adding document",
          name: "addNote", error: e, stackTrace: stackTrace);
      return false;
    }
  }

  // return db.collection(notesKey).add(note.toJson()).then(
  //   (DocumentReference doc) {
  //     log('DocumentSnapshot added with ID: ${doc.id}');
  //     return true;
  //   },
  // ).catchError(
  //   (error) {
  //     log('Error adding document: $error', name: "addNote");
  //     return false;
  //   },
  // );

  Stream<QuerySnapshot<Map<String, dynamic>>> get notesStream =>
      _notesController.stream;

  void dispose() {
    _notesController.close();
  }
}
