import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  final ImagePicker _picker =
      ImagePicker();

  Future<String?> pickFromGallery() async {
    final image =
        await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) {
      return null;
    }

    return saveImage(
      File(image.path),
    );
  }

  Future<String?> pickFromCamera() async {
    final image =
        await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image == null) {
      return null;
    }

    return saveImage(
      File(image.path),
    );
  }

  Future<String> saveImage(
    File imageFile,
  ) async {

    final appDir =
        await getApplicationDocumentsDirectory();

    final fileName =
        basename(imageFile.path);

    final savedImage =
        await imageFile.copy(
      '${appDir.path}/$fileName',
    );

    return savedImage.path;
  }
}