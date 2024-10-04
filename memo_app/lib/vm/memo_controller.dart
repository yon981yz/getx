import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:memo_app/model/memo.dart';

class MemoController extends GetxController{
  final memos = <Memo>[].obs;
  final CollectionReference _memos = 
      FirebaseFirestore.instance.collection('memos');


  @override
  void onInit() {
    super.onInit();
    _memos.snapshots().listen(
      (event){
        memos.value = event.docs.map(
          (doc) => Memo.formMap(doc.data() as Map<String, dynamic>, doc.id),
        )
        .toList();
      }
    );
  }

  addMemo(String title, String content){
    _memos.add(
      {
        'title' : title,
        'content' : content,
      }
    );
  }

  deleteMemo(String id){
    _memos.doc(id).delete();
  }
}