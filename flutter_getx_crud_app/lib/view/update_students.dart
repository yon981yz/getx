import 'package:flutter/material.dart';
import 'package:flutter_getx_crud_app/vm/vm_handler.dart';
import 'package:get/get.dart';

class UpdateStudents extends StatelessWidget {
  UpdateStudents({super.key});

  final value = Get.arguments ?? "__";
  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          codeController.text = value[0];
          nameController.text = value[1];
          deptController.text = value[2];
          phoneController.text = value[3];
          addressController.text = value[4];
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '학번을 입력 하세요'
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '이름을 입력 하세요'
                  ),
                ),
                TextField(
                  controller: deptController,
                  decoration: const InputDecoration(
                    labelText: '전공을 입력 하세요'
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: '전화번호를 입력 하세요'
                  ),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: '주소를 입력 하세요'
                  ),
                ),
                ElevatedButton(
                  onPressed: () => updateJSONData(vmHandler), 
                  child: const Text('입력'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //Function
  updateJSONData(VmHandler vmHandler) async {
    String code = value[0];
    String name =nameController.text;
    String dept =deptController.text;
    String phone =phoneController.text;
    String address =addressController.text;
    print(code);
    print(name);
    print(dept);
    print(phone);
    print(address);
    var results = 
      await vmHandler.updateJSONData(code, name, dept, phone, address);
    if (results == 'OK'){
      Get.back();
    }else{
      print("Error");
    }

  }
}// END
