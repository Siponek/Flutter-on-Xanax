import 'package:equatable/equatable.dart';

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
}

class LocationEntity extends Equatable {
  const LocationEntity({
    required this.longtitute,
    required this.latitute,
  });

  final double longtitute;
  final double latitute;

  @override
  List<Object?> get props => [
        longtitute,
        latitute,
      ];
}
