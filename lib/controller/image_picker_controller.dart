import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  ImagePickerController();
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> getImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<List<XFile>> getMultiImage() async {
    return await _picker.pickMultiImage();
  }
}
