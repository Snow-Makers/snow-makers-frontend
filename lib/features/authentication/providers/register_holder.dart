import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterHolder extends ChangeNotifier {
  static final provider = ChangeNotifierProvider((ref) => RegisterHolder());

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
}
