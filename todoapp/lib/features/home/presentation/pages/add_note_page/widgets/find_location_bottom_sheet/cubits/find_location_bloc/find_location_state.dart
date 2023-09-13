import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_webservice/places.dart';

part 'find_location_state.freezed.dart';

@freezed
class FindLocationState with _$FindLocationState {
  const factory FindLocationState.error() = _ErrorState;
  const factory FindLocationState.loaded(
      {required List<Prediction> placePredictions}) = _LoadedState;

  const FindLocationState._();
}
