import 'package:equatable/equatable.dart';

class Launch extends Equatable {
  final String missionName;
  final String details;

  Launch(this.missionName, this.details);

  @override
  List<Object?> get props => [missionName, details];

  static Launch fromJson(dynamic json) {
    return Launch(
      json['mission_name'],
      json['details'] ?? '',
    );
  }

}