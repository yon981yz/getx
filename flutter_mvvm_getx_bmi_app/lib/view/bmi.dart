import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx_bmi_app/vm/calcbmi.dart';
import 'package:get/get.dart';

class Bmi extends StatelessWidget {
  Bmi({super.key});

//property

  final TextEditingController hightcontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final Calcbmi calcbmi = Get.put(Calcbmi());
    Get.put(Calcbmi());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('BMI'),
      ),

      body: GetBuilder<Calcbmi>(
        builder: (calcbmi) {          
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: hightcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Please input your height',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: weightcontroller,
                    decoration: const InputDecoration(
                      labelText: 'Please input your weight',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      bmiCalculation(calcbmi);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ), 
                    child: const Text('Calculate BMI')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    calcbmi.bmiresultText
                  ),
                ),
                Stack(
                  children: [ 
                    Image.asset(
                    'images/bmi.jpg',
                    width: 300,
                    ),
                    Positioned(
                      top: 50,
                      left: calcbmi.arrow,
                      child: Image.asset(
                        'images/arrow.jpeg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  //// Function

  bmiCalculation(Calcbmi calcbmi){
    if (hightcontroller.text.trim().isEmpty || weightcontroller.text.trim().isEmpty) {
      errorbox();
    }else{
      calcbmi.hei = double.parse(hightcontroller.text.trim());
      calcbmi.wei = double.parse(weightcontroller.text.trim());
      calcbmi.calculationResult();
    }
  }

  errorbox(){
    Get.snackbar(
      'Error', 
      'Please input numeber',
      backgroundColor: Colors.red,
    );
  }
  }
