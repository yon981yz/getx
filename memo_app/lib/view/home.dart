import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memo_app/model/memo.dart';
import 'package:memo_app/vm/memo_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final MemoController memoController = Get.put(MemoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: memoController.memos.length,
                itemBuilder: (context, index) {
                  Memo memo = memoController.memos[index];
                  return ListTile(
                    title: Text(memo.title),
                    subtitle: Text(memo.content),
                    trailing: IconButton(
                      onPressed: () => memoController.deleteMemo(memo.id), 
                      icon: const Icon(Icons.delete)),
                  );
                  
                },
              ),
            ),
          ),
          Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: '제목을 입력하세요'
                ),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: '내용을 입력하세요'
                ),
              ),
              ElevatedButton(
                onPressed: () {
                if(titleController.text.isNotEmpty && contentController.text.isNotEmpty){
                  memoController.addMemo(
                    titleController.text, contentController.text);
                  titleController.clear();
                  contentController;
                }
                }, 
                child: const Text('메모 추가')
              ),
            ],
          )
        ],
      )
    );
  }
}