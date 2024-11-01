import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/units/models/location.dart';

class Unit {
  final String modelId;
  final String password;
  final Location location;
  final Reservation? reservation;
  final String userId;
  final num maxTemperature;
  final bool isOccupation;
  final int duration;
  final num? temperature;
  final int unitFunction;
  final int timer;
  final num? humidity;
  bool? isActive;
  final bool isSwing;

  Unit({
    required this.modelId,
    required this.password,
    required this.location,
    required this.userId,
    this.reservation,
    this.isActive = false,
    this.temperature,
    this.unitFunction = -1,
    this.timer = 0,
    this.maxTemperature = 0.0,
    this.isOccupation = true,
    this.duration = 0,
    this.humidity,
    this.isSwing = false,
  });

  Unit copyWith({
    String? modelId,
    String? password,
    Location? location,
    Reservation? reservation,
    String? userId,
    num? temperature,
    int? unitFunction,
    num? humidity,
    bool? isActive,
    int? timer,
    bool? isOccupation,
    int? duration,
    double? maxTemperature,
    bool? isSwing,
  }) {
    return Unit(
      modelId: modelId ?? this.modelId,
      password: password ?? this.password,
      location: location ?? this.location,
      reservation: reservation ?? this.reservation,
      userId: userId ?? this.userId,
      temperature: temperature ?? this.temperature,
      unitFunction: unitFunction ?? this.unitFunction,
      humidity: humidity ?? this.humidity,
      isActive: isActive ?? this.isActive,
      timer: timer ?? this.timer,
      isOccupation: isOccupation ?? this.isOccupation,
      isSwing: isSwing ?? this.isSwing,
      duration: duration ?? this.duration,
      maxTemperature: maxTemperature ?? this.maxTemperature,
    );
  }

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      modelId: json['modelId'],
      password: json['password'],
      userId: json['userId'],
      unitFunction: json['unitFunction'] ?? -1,
      temperature: json['temperature'],
      humidity: json['humidity'],
      timer: json['timer'] ?? 0,
      isActive: json['isActive'] ?? false,
      isSwing: json['isSwing'] ?? false,
      location: Location.fromJson(json['location']),
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'])
          : null,
      maxTemperature: json['maxTemperature'] ?? 0.0,
      isOccupation: json['isOccupation'] ?? true,
      duration: json['duration'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modelId'] = modelId;
    data['password'] = password;
    data['userId'] = userId;
    data['unitFunction'] = unitFunction;
    data['temperature'] = temperature;
    data['humidity'] = humidity;
    data['timer'] = timer;
    data['maxTemperature'] = maxTemperature;
    data['isOccupation'] = isOccupation;
    data['duration'] = duration;
    data['isSwing'] = isSwing;
    if (isActive != null) {
      data['isActive'] = isActive;
    }
    data['location'] = location.toJson();
    if (reservation != null) {
      data['reservation'] = reservation!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Unit{modelId: $modelId, password: $password, location: $location, reservation: $reservation, userId: $userId , temperature: $temperature, unitFunction: $unitFunction, humidity: $humidity, isActive: $isActive, timer: $timer}';
  }
}
