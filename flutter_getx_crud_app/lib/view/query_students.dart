import 'package:flutter/material.dart';
import 'package:flutter_getx_crud_app/view/insert_students.dart';
import 'package:flutter_getx_crud_app/view/update_students.dart';
import 'package:flutter_getx_crud_app/vm/vm_handler.dart';
import 'package:get/get.dart';

class QueryStudents extends StatelessWidget {
  const QueryStudents({super.key});

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.put(VmHandler());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => InsertStudents())!.then((value) {
                vmHandler.getJSONData();
              });
            },
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: GetBuilder<VmHandler>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.getJSONData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else {
                return Obx(
                  () {
                    return ListView.builder(
                      itemCount: vmHandler.student.length,
                      itemBuilder: (context, index) {
                        final student = vmHandler.student[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(()=> UpdateStudents(), arguments: [
                              student.scode,
                              student.sname,
                              student.sdept,
                              student.sphone,
                              student.saddress,
                            ])!.then((value) => vmHandler.getJSONData());
                          },
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Code : ${student.scode}"),
                                Text("Name : ${student.sname}"),
                                Text("Dept : ${student.sdept}"),
                                Text("Phone : ${student.sphone}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
