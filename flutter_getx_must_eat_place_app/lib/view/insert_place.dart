import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_getx_must_eat_place_app/model/address.dart';
import 'package:flutter_getx_must_eat_place_app/vm/vm_handler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InsertPlace extends StatelessWidget {
  InsertPlace({super.key});
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController estimateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    vmHandler.checkLocationPermission();

    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 추가'),
        leading: IconButton(
            onPressed: () {
              vmHandler.imageFile = null;
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          latController.text = controller.latitude;
          lngController.text = controller.longitude;

          return Center(
              child: controller.latitude.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('GPS 데이터를 수집 중 입니다'),
                          CircularProgressIndicator()
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () => controller
                                    .getImageFromGallery(ImageSource.gallery),
                                child: const Text('이미지 가져오기'),
                              ),
                              ElevatedButton(
                                onPressed: () => controller
                                    .getImageFromGallery(ImageSource.camera),
                                child: const Text('Camera'),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            color: Colors.grey,
                            child: Center(
                              child: controller.imageFile == null
                                  ? const Text('이미지가 선택되지 않았습니다')
                                  : Image.file(
                                      File(controller.imageFile!.path)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  readOnly: true,
                                  controller: latController,
                                  decoration:
                                      const InputDecoration(labelText: '위도'),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  readOnly: true,
                                  controller: lngController,
                                  decoration:
                                      const InputDecoration(labelText: '경도'),
                                ),
                              ),
                            ],
                          ),
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: '이름',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: '전화번호',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          TextField(
                            controller: estimateController,
                            decoration: const InputDecoration(
                              labelText: '평가',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3,
                            maxLength: 50,
                          ),
                          ElevatedButton(
                              onPressed: () => insertAction(vmHandler),
                              child: const Text('입력')),
                        ],
                      ),
                    ));
        },
      ),
    );
  }

  //Function
  insertAction(VmHandler vmHandler) async {
    File imageFile1 = File(vmHandler.imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    var addressInsert = Address(
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        estimate: estimateController.text.trim(),
        lat: double.parse(latController.text.trim()),
        lng: double.parse(lngController.text.trim()),
        image: getImage);

    await vmHandler.insertAddress(addressInsert);
    vmHandler.imageFile = null;
    Get.back();
  }
}//End