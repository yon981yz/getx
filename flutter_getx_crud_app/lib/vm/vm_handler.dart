import 'dart:convert';

import 'package:flutter_getx_crud_app/model/student.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class VmHandler extends GetxController{
  var student = <Student>[].obs;

  getJSONData() async {
    student.clear();
    var url=Uri.parse('http://127.0.0.1:8000/select?');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List results = dataConvertedJSON['results'];

    List<Student> returnResult = [];
    for(int i=0; i<results.length; i++){
      String scode = results[i]['code'];
      String sname = results[i]['name'];
      String sdept = results[i]['dept'];
      String sphone = results[i]['phone'];
      String? saddress = results[i]['address'];

      saddress ??= '__';
      returnResult.add(Student(
        scode: scode, 
        sname: sname, 
        sdept: sdept, 
        sphone: sphone, 
        saddress: saddress
      ));

  }
    student.value = returnResult;
}
  insertJSONData(String code, String name, String dept, String phone, String address)async{
    var url=Uri.parse('http://127.0.0.1:8000/insert?code=${code}&name=${name}&dept=${dept}&phone=${phone}&address=${address}');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var results = dataConvertedJSON['results'];
    return results;

  }
  updateJSONData(String code, String name, String dept, String phone, String address)async{
    var url=Uri.parse('http://127.0.0.1:8000/update?code=${code}&name=${name}&dept=${dept}&phone=${phone}&address=${address}');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    var results = dataConvertedJSON['results'];
    return results;

  }
}