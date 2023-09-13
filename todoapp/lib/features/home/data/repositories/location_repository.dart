import 'package:google_maps_webservice/places.dart';

class LocationRepository {
  LocationRepository();

  // TODO remove place

  final _places =
      GoogleMapsPlaces(apiKey: 'AIzaSyD4MmrS2Gz6kw3TXeVNJz-bljlsNjI3ZTU');

  Future<List<Prediction>> searchPlaces(String query) async {
    final PlacesAutocompleteResponse result = await _places.autocomplete(query);

    if (result.status == "OK") {
      return result.predictions;
    } else {
      throw Exception(result.errorMessage);
    }
  }

  Future<PlaceDetails> getDetailsOfPlaceId(String placeId) async {
    final PlacesDetailsResponse result =
        await _places.getDetailsByPlaceId(placeId);

    if (result.status == "OK") {
      return result.result;
    } else {
      throw Exception(result.errorMessage);
    }
  }
}
