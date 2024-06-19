import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgetPasswordHolder extends ChangeNotifier {
  static final provider =
      ChangeNotifierProvider((ref) => ForgetPasswordHolder());

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
}
