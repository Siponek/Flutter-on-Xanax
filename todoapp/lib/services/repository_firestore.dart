import 'dart:async';
import 'dart:developer'; // For using log
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/features/home/domain/entities/note_input.dart';

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

  Future<bool> addNote(NoteInput noteInput) async {
    try {
      // TODO create a separate cubit for uploading images to display an error.
      String? imageUrl;
      if (noteInput.pathToImage != null) {
        // TODO check if upload was successful
        imageUrl = await uploadImageToFirebase(noteInput.pathToImage!);
        if (imageUrl == "") {
          log("Error uploading image to Firebase", name: "addNote");
          return false;
        }
      }
      // TODO make the saves to Firestore transactional
      // TODO check if the note already exists
      // TODO make the save to Firestore individual for each user
      //  final documentReference = db.collection(notesKey).doc(specificId);
      // final snapshot = await documentReference.get();
      // if(snapshot.exists) {
      //   log('Document with ID: $specificId already exists', name: "addNote");
      //   return false;
      // }
      // await documentReference.set(noteInput.toFireStoreJsons(imageUrl: imageUrl));
      // log('DocumentSnapshot added with ID: $specificId', name: "addNote");

      final result = await db
          .collection(notesKey)
          .add(noteInput.toFireStoreJsons(imageUrl: imageUrl));
      log('DocumentSnapshot added with ID: ${result.id}', name: "addNote");
      return true;
    } catch (e, stackTrace) {
      // Catch the error as 'e'
      log("Error adding document",
          name: "repository_firebase", error: e, stackTrace: stackTrace);
      return false;
    }
  }

  Future<bool> deleteNote(String noteId) async {
    try {
      await db.collection(notesKey).doc(noteId).delete();
      log('DocumentSnapshot deleted with ID: $noteId', name: "deleteNote");
      return true;
    } catch (e, stackTrace) {
      // Catch the error as 'e'
      log("Error deleting document",
          name: "repository_firebase", error: e, stackTrace: stackTrace);
      return false;
    }
  }

  void saveImageUrlToFirestore(String imageUrl, String documentId) {
    FirebaseFirestore.instance
        .collection('your_collection_name')
        .doc(documentId)
        .update({"image_url": imageUrl});
  }

  Future<String> uploadImageToFirebase(String pathToFile) async {
    const String folder = 'images';

    String imageId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref;
    try {
      // Create a reference to the file location
      ref = FirebaseStorage.instance.ref().child("$folder/$imageId.jpg");
      UploadTask uploadTask = ref.putFile(File(pathToFile));
      await ref.putFile(File(pathToFile));
      await uploadTask.catchError((e) {
        log("uploadImageToFirebase catchError: ${e.toString()}");
        throw e;
      });
      // ignore: unused_local_variable
      TaskSnapshot taskSnapshot = await uploadTask
          .whenComplete(() => log("uploadImageToFirebase Success"));
    } catch (e, stackTrace) {
      log("uploadImageToFirebase Instance: ${e.toString()}",
          error: e, stackTrace: stackTrace);
      return "";
    }
    // Upload the file
    // log("imageFile.path: ${imageFile.path}");
    try {
      // TODO blob
      // await ref.putBlob(imageFile.)
      // Retrieve the download URL
      String downloadUrl = await ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      log("Error while retrieving image URL at uploadImageToFirebase(): ${e.toString()}");
      return "";
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get notesStream =>
      _notesController.stream;

  void dispose() {
    _notesController.close();
  }
}
