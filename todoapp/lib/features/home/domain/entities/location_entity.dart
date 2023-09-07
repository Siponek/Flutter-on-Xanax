import 'package:equatable/equatable.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'longtitute': longtitute,
      'latitute': latitute,
    };
  }

  static LocationEntity fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      longtitute: json['longtitute'] as double,
      latitute: json['latitute'] as double,
    );
  }
}
