import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_webservice/places.dart';


/// Class for user input at the add note screen
class NoteInput extends Equatable {
  const NoteInput({
    this.title,
    this.description,
    this.pathToImage,
    this.location,
    // this.date,
  });

  final String? title;
  final String? description;
  final String? pathToImage;
  final PlaceDetails? location;
  // final DateTime? date;

  bool isReadyToAdd() =>
      title != null &&
      title!.isNotEmpty &&
      description != null &&
      description!.isNotEmpty;
  //  &&
  // imageUrl != null &&
  // imageUrl!.isNotEmpty &&
  // location != null &&
  // date != null;

  @override
  List<Object?> get props => [
        title,
        description,
        pathToImage,
        location,
        // date,
      ];

  GeoPoint? getGeoPointFromLocation(PlaceDetails? location) =>
      location?.geometry?.location == null
          ? null
          : GeoPoint(
              location!.geometry!.location.lat,
              location.geometry!.location.lng,
            );

  /// Method for preparing the note input to be sent to Firestore. Json withing Json
  Map<String, dynamic> toFireStoreJsons({String? imageUrl}) {
    GeoPoint? geoPoint = getGeoPointFromLocation(location);

    if (geoPoint != null) {
      log("GeoPoint is ${geoPoint.latitude}, ${geoPoint.longitude}",
          name: "note_input");
    }

    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'location': geoPoint,
      // 'date': date?.toIso8601String(),
    };
  }

  // static NoteInput noteInputFromJson(Map<String, dynamic> json) {
  //   return NoteInput(
  //     title: json['title'] as String,
  //     description: json['description'] as String,
  //     pathToImage: json['pathToImage'] as String,
  //     location: PlaceDetails.fromJson(json['location'] as Map<String, dynamic>),
  //     // date: DateTime.parse(json['date'] as String),
  //   );
  // }

  NoteInput copyWith({
    String? title,
    String? description,
    String? pathToImage,
    PlaceDetails? location,
    DateTime? date,
  }) {
    return NoteInput(
      title: title ?? this.title,
      description: description ?? this.description,
      pathToImage: pathToImage ?? this.pathToImage,
      location: location ?? this.location,
      // date: date ?? this.date,
    );
  }
}
