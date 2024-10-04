import 'package:flutter_getx_must_eat_place_app/vm/gps_handler.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler extends GpsHandler{
  XFile? imageFile;
  late int firstDisp = 0;
  final ImagePicker picker = ImagePicker();

  getImageFromGallery(ImageSource imageSource)async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = XFile(pickedFile!.path);
    update();
  }

    Future getImageFromGalleryEdit(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      return;
    } else {
      imageFile = XFile(pickedFile.path);
      firstDisp++;
      update();
    }
  }
}