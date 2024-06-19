class Reservation {
  final String id;
  final String unitId;
  final String email;
  final String name;
  final String? phone;
  final List<String> dates;
  final String? ownerId;

  Reservation({
    required this.unitId,
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    required this.dates,
    this.ownerId,
  });

  Reservation copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    List<String>? dates,
    String? ownerId,
    String? unitId,
  }) {
    return Reservation(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dates: dates ?? this.dates,
      ownerId: ownerId ?? this.ownerId,
      unitId: unitId ?? this.unitId,
    );
  }

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      unitId: json['unitId'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      ownerId: json['ownerId'],
      dates: List<String>.from(json['dates'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unitId'] = unitId;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['ownerId'] = ownerId;
    if (dates.isNotEmpty) {
      data['dates'] = dates;
    }
    return data;
  }

  @override
  String toString() {
    return 'Reservation{id: $id, email: $email, name: $name, phone: $phone, dates: $dates, ownerId: $ownerId, unitId: $unitId}';
  }
}
