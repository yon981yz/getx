import 'package:flutter/material.dart';
import 'package:textfield_calc_getx_app/vm/calc.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  //property

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController addController = TextEditingController();
  final TextEditingController subController = TextEditingController();
  final TextEditingController mulController = TextEditingController();
  final TextEditingController divController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Calc calc = Get.put(Calc());
    // Get.put(Calc());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calc'),
        ),
        body: GetBuilder<Calc>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: num1Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Please input number'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: num2Controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Please input number'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                calcAction(calc);
                                //   if(num1Controller.text.trim().isNotEmpty && num2Controller.text.trim().isNotEmpty){
                                //   calc.add(num1Controller.text, num2Controller.text);
                                //   calc.sub(num1Controller.text, num2Controller.text);
                                //   calc.mul(num1Controller.text, num2Controller.text);
                                //   calc.div(num1Controller.text, num2Controller.text);
                                //   addController.text = calc.sumresult.toString();
                                //   subController.text = calc.subresult.toString();
                                //   mulController.text = calc.mulresult.toString();
                                //   divController.text = calc.divresult.toString();
                                // }else{
                                //   errorMessage();
                                // }
                              },
                              child: const Text('Calculate')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                removeAction();
                                // num1Controller.clear();
                                // num2Controller.clear();
                                // addController.clear();
                                // subController.clear();
                                // mulController.clear();
                                // divController.clear();
                              },
                              child: const Text('Erase')),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: addController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'add result'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: subController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'sub result'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: mulController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'mul result'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: divController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'div result'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ///function
  errorMessage() {
    Get.snackbar(
      'Error',
      'Please input number',
      backgroundColor: Colors.red,
      animationDuration: const Duration(seconds: 3),
    );
  }

  calcAction(calc) {
    if (num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty) {
      errorMessage();
    } else {
      calc.num1 = int.parse(num1Controller.text.trim());
      calc.num2 = int.parse(num2Controller.text.trim());
      calc.calculation();
      addController.text = calc.sumresult.toString();
      subController.text = calc.subresult.toString();
      mulController.text = calc.mulresult.toString();
      divController.text = calc.divresult.toStringAsFixed(3);
    }
  }

  removeAction() {
    num1Controller.clear();
    num2Controller.clear();
    addController.clear();
    subController.clear();
    mulController.clear();
    divController.clear();
  }
}// END
