import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/home/data/repositories/location_repository.dart';
import 'package:todoapp/features/home/presentation/pages/add_note_page/widgets/find_location_bottom_sheet/cubits/find_location_bloc/find_location_state.dart';
import 'package:rxdart/rxdart.dart';

class FindLocationEvent {
  FindLocationEvent({required this.searchText});

  final String searchText;
}

class FindLocationBloc extends Bloc<FindLocationEvent, FindLocationState> {
  FindLocationBloc({
    required LocationRepository locationRepository,
  })  : _locationRepository = locationRepository,
        super(const FindLocationState.loaded(placePredictions: [])) {
    EventTransformer<FindLocationEvent> debounce<FindLocationEvent>(
        Duration duration) {
      return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
    }

    on<FindLocationEvent>(
      _onFindLocationEvent,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
  }

  final LocationRepository _locationRepository;

  Future<void> searchOnChange(String searchText) async {
    add(FindLocationEvent(searchText: searchText));
  }

  Future<void> _onFindLocationEvent(
    FindLocationEvent event,
    Emitter<FindLocationState> emit,
  ) async {
    if (event.searchText.isEmpty) {
      emit(const FindLocationState.loaded(placePredictions: []));
      return;
    }

    final placeSuggestions =
        await _locationRepository.searchPlaces(event.searchText);

    emit(FindLocationState.loaded(placePredictions: placeSuggestions));
  }
}
