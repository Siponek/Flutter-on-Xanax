import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';

class RepositoryFirestore {
  static final db = FirebaseFirestore.instance;

  static const String notesKey = 'notes';

  void addNote(NoteEntity note) {
    db.collection(notesKey).add(note.toJson()).then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'),
        );
  }

  Stream get notesStream => db.collection(notesKey).snapshots();
}
