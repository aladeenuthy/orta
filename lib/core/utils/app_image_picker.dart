import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  AppImagePicker({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  Future<String?> pickProfileImagePath() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 900,
      imageQuality: 85,
    );

    return image?.path;
  }
}
