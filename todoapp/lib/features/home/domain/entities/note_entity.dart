
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


/// Class for the note entity that is displayed in the UI list
class NoteEntity extends Equatable {
  const NoteEntity({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.location,
    // required this.date,
  });

  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final GeoPoint? location;
  // final PlaceDetails location;
  // final DateTime date;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        location,
        // date,
      ];

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'imageUrl': imageUrl,
  //     'location': location.toJson(),
  //     // 'date': date.toIso8601String(),
  //   };
  // }

  static NoteEntity noteEntityFromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      location: json['location'] as GeoPoint?,
      // : PlaceDetails?.fromJson(json['location'] as Map<String, dynamic>),
      // date: DateTime.parse(json['date'] as String),
    );
  }
}
