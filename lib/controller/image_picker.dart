import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/main.dart';

class FileWithName {
  final File file;
  final String name;
  FileWithName({
    required this.file,
    required this.name,
  });
}

class ImagePickerController extends GetxController {
  ImagePickerController();
  final ImagePicker _picker = ImagePicker();

  Future<FileWithName?> getImage() async {
    final response = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 70,
    );
    if (response != null) {
      final croppedFile = await _cropImage(image: File(response.path));
      if (croppedFile != null) {
        return FileWithName(
          file: croppedFile,
          name: response.name,
        );
      }
    }
    return null;
  }

  Future<List<XFile>> getMultiImage() async {
    return await _picker.pickMultiImage(
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 70,
    );
  }

  Future<File?> _cropImage({
    required File image,
  }) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 90,
        // aspectRatio: CropAspectRatio(ratioX: 375, ratioY: 257),
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '사진편집',
            toolbarColor: CColors.white,
            toolbarWidgetColor: CColors.black,
            activeControlsWidgetColor: CColors.white,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            aspectRatioLockEnabled: false, // true
            aspectRatioLockDimensionSwapEnabled: true,
            resetAspectRatioEnabled: true,
            // minimumAspectRatio: 1.0, // 주석해제
            // title: '사진편집',
          ),
          WebUiSettings(
            context: navigatorKey.currentState!.context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'square'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
