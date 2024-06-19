extension FieldValidate on String {
  String? validate(List<String? Function(String?)> functions) {
    for (final String? Function(String?) func in functions) {
      final result = func(this);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

String? validateRequired(String? value) {
  return value!.trim().isEmpty ? "" : null;
}

String? validateEmail(String? value) {
  final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!regex.hasMatch(value!)) {
    return "Invalid Email";
  }
  return null;
}

String? validateName(String? value) {
  final regex = RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  if (!regex.hasMatch(value!)) {
    return "Invalid Name";
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  final RegExp phoneRegExp = RegExp(r'^\+?\d+$');
  if (!phoneRegExp.hasMatch(value!)) {
    return "Invalid Phone Number";
  }
  return null;
}
