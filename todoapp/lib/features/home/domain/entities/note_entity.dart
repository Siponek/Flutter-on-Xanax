import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class NoteEntity extends Equatable {
  const NoteEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.date,
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final LocationEntity location;
  final DateTime date;

  @override
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'location': location.toJson(),
      'date': date.toIso8601String(),
    };
  }

  static NoteEntity fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      location:
          LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );
  }
}
