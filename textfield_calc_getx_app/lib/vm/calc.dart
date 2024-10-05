import 'package:get/get_state_manager/get_state_manager.dart';

// class Calc extends GetxController{

//   double num1 = 0;
//   double num2 = 0;

//   double sumresult = 0;
//   double subresult = 0;
//   double mulresult = 0;
//   double divresult = 0;

//   add(String number1, String number2){
//     sumresult = double.parse(number1) + double.parse(number2);
//   }

//   sub(String number1, String number2){
//     subresult = double.parse(number1) - double.parse(number2);
//   }

//   mul(String number1, String number2){
//     mulresult = double.parse(number1) * double.parse(number2);
//   }

//   div(String number1, String number2){
//     divresult = double.parse(number1) / double.parse(number2);
//   }
// }

class Calc extends GetxController{

  int num1 = 0;
  int num2 = 0;

  int sumresult = 0;
  int subresult = 0;
  int mulresult = 0;
  double divresult = 0;

calculation(){
  add();
  sub();
  mul();
  div();
  update();
}

  add(){
    sumresult = num1 + num2;
  }

  sub(){
    subresult = num1 - num2;
  }

  mul(){
    mulresult = num1 * num2;
  }

  div(){
    divresult = num1.toDouble() / num2.toDouble();
  }
}