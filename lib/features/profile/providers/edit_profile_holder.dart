import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileHolder extends ChangeNotifier {
  static final provider =
      ChangeNotifierProvider<EditProfileHolder>((ref) => EditProfileHolder());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  File? image;
  final formKey = GlobalKey<FormState>();

  void setImage(File image) {
    this.image = image;
    notifyListeners();
  }

  void pickGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setImage(File(image.path));
    }
  }

  void pickCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setImage(File(image.path));
    }
  }

  void clearImage() {
    image = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    clearImage();
    formKey.currentState?.dispose();
    super.dispose();
  }
}
