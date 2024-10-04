import 'package:get/get_state_manager/get_state_manager.dart';

class Calcbmi extends GetxController{

 // Property
  double hei = 0;
  double wei = 0;

  double arrow = 0;
  double bmiresult = 0;
  String bmiresultstatus = '';
  String bmiresultText = '';

  calculation(){
    bmiresult = wei / ((hei/100) * (hei/100));
  }

  calculationResult(){
    calculation();
    if (bmiresult < 18.5) {
      arrow = 20;
      bmiresultstatus = '저체중';
      bmiresultText = '귀하의 bmi 지수는 ${bmiresult.toStringAsFixed(2)} 이고 $bmiresultstatus 입니다';
    } else if (bmiresult < 22.9 && bmiresult > 18.5){
      arrow = 75;
      bmiresultstatus = '정상체중';
      bmiresultText = '귀하의 bmi 지수는 ${bmiresult.toStringAsFixed(2)}이고 $bmiresultstatus 입니다';
    } else if (bmiresult < 24.9 && bmiresult > 23.0){
      arrow = 130;
      bmiresultstatus = '과체중';
      bmiresultText = '귀하의 bmi 지수는 ${bmiresult.toStringAsFixed(2)} 이고 $bmiresultstatus 입니다';
    } else if (bmiresult < 29.9 && bmiresult > 25.0){
      arrow = 180;
      bmiresultstatus = '비만';
      bmiresultText = '귀하의 bmi 지수는 ${bmiresult.toStringAsFixed(2)} 이고 $bmiresultstatus 입니다';
    } else if (bmiresult > 30.0){
      arrow = 235;
      bmiresultstatus = '고도비만';
      bmiresultText = '귀하의 bmi 지수는 ${bmiresult.toStringAsFixed(2)} 이고 $bmiresultstatus 입니다';
    }
  update();
}



}
