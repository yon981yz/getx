import 'package:get/get_state_manager/get_state_manager.dart';

class Count extends GetxController{
  int counter = 0;

  add(){
    counter++;
    update();
  }
  sub(){
    counter--;
    update();
  }

}
