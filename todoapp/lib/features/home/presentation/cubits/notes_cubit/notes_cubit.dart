import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/domain/entities/note_entity.dart';
import 'package:todoapp/features/home/presentation/cubits/notes_cubit/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesState.loading()) {
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final List<NoteEntity> mockNotes = [
      NoteEntity(
        id: 'id',
        title: 'title',
        description: 'description',
        imageUrl:
            'https://wykop.pl/cdn/c3201142/comment_1640433665JmpFARanZ2LxydpRWria0N,w400.jpg',
        location: const LocationEntity(longtitute: 2, latitute: 3),
        date: DateTime.now(),
      ),
      NoteEntity(
        id: 'id',
        title: 'title3',
        description: 'description',
        imageUrl:
            'https://wykop.pl/cdn/c3201142/comment_1640433665JmpFARanZ2LxydpRWria0N,w400.jpg',
        location: const LocationEntity(longtitute: 2, latitute: 3),
        date: DateTime.now(),
      ),
    ];

    emit(const NotesState.loading());
    await Future.delayed(const Duration(seconds: 5));
    emit(NotesState.loaded(mockNotes));
  }
}
