import 'package:count_app/vm/count.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Count count = Get.put(Count());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX - State'),
      ),
      body: GetBuilder<Count>(
        builder: (controller) {
          return Center(
            child: Text(
              count.counter.toString(),
              style: const TextStyle(
                fontSize: 40
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              count.add();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              count.sub();
            },
            icon: const Icon(Icons.remove),
          ),
      ],),
    );
  }
}