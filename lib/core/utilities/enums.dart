enum ThemeFlavor {
  light,
  dark,
  system;

  static const defaultValue = ThemeFlavor.system;

  factory ThemeFlavor.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return ThemeFlavor.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum LocalDataType {
  secured,
  simple;

  static const defaultValue = LocalDataType.simple;

  factory LocalDataType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return LocalDataType.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum MessageType {
  text,
  suggestion,
  record;

  static const defaultValue = MessageType.text;

  factory MessageType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return MessageType.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum AuthenticationType {
  apple,
  google,
  simple;

  static const defaultValue = AuthenticationType.simple;

  factory AuthenticationType.fromString(String? name) {
    if (name == null || name == '') return defaultValue;

    return AuthenticationType.values.firstWhere(
      (flavor) => flavor.name == name,
      orElse: () => defaultValue,
    );
  }
}

enum UnitFunctions {
  none(-1),
  manual(0),
  automatic(1),
  temperature(2);

  final int value;

  factory UnitFunctions.fromValue(int value) {
    return UnitFunctions.values
        .firstWhere((element) => element.value == value);
  }

  const UnitFunctions(this.value);
}
