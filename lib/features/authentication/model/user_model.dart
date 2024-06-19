import 'package:snowmakers/features/reservation/models/reservation.dart';
import 'package:snowmakers/features/units/models/unit.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? photoUrl;
  final List<Unit> units;
  final List<Reservation>? reservations;
  UserModel({
    this.name = "",
    this.email = "",
    this.photoUrl = "",
    this.units = const [],
    this.reservations,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      photoUrl: json['photoUrl'] ?? "",
      units: json['units'] != null
          ? List<Unit>.from(json['units'].map((x) => Unit.fromJson(x)))
          : [],
      reservations: json['reservations'] != null
          ? List<Reservation>.from(
              json['reservations'].map((x) => Reservation.fromJson(x)))
          : [],
    );
  }


  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, photoUrl: $photoUrl, units: $units, reservations: $reservations}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    if(units.isNotEmpty) {
      data['units'] = units.map((x) => x.toJson()).toList();
    }
    if(reservations != null) {
      data['reservations'] = reservations!.map((x) => x.toJson()).toList();
    }
    return data;
  }

  factory UserModel.guest() {
    return UserModel(
      email: "Guest@Guest.com",
      name: "Guest",
    );
  }

  UserModel copyWith({
    String? photoUrl,
    String? name,
    String? email,
    List<Unit>? units,
    List<Reservation>? reservations,
  }) {
    return UserModel(
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      name: name ?? this.name,
      units: units ?? this.units,
      reservations: reservations ?? this.reservations,
    );
  }
}
