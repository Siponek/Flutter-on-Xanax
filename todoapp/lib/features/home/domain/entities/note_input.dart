import 'package:equatable/equatable.dart';

import 'location_entity.dart';

class NoteInput extends Equatable {
  const NoteInput({
    this.title,
    this.description,
    this.pathToImage,
    // this.location,
    // this.date,
  });

  final String? title;
  final String? description;
  final String? pathToImage;
  // final LocationEntity? location;
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
        // location,
        // date,
      ];

  Map<String, dynamic> toFireStoreJson({String? imageUrl}) {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      // 'location': location?.toJson(),
      // 'date': date?.toIso8601String(),
    };
  }

  static NoteInput fromJson(Map<String, dynamic> json) {
    return NoteInput(
      title: json['title'] as String,
      description: json['description'] as String,
      pathToImage: json['pathToImage'] as String,
      // location:
      //     LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
      // date: DateTime.parse(json['date'] as String),
    );
  }

  NoteInput copyWith({
    String? title,
    String? description,
    String? pathToImage,
    LocationEntity? location,
    DateTime? date,
  }) {
    return NoteInput(
      title: title ?? this.title,
      description: description ?? this.description,
      pathToImage: pathToImage ?? this.pathToImage,
      // location: location ?? this.location,
      // date: date ?? this.date,
    );
  }
}
