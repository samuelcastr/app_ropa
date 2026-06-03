import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageService {
  final ImagePicker _picker =
      ImagePicker();

  Future<String?> pickAndSaveImage() async {
    final image =
        await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) {
      return null;
    }

    final appDir =
        await getApplicationDocumentsDirectory();

    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}${extension(image.path)}';

    final savedImage =
        await File(image.path).copy(
      '${appDir.path}/$fileName',
    );

    return savedImage.path;
  }
}