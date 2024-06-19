import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => LoginHolder());

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
}
