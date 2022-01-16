import 'package:flutter/material.dart';
import 'package:midterm_620710156/main.dart';

void main() {
  runApp(const MyApp());
}

class Pig extends StatelessWidget {
  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'PIG WEIGHT',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'CALCULATOR',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/pig.png',
                height: 150,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('LENGTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _lengthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter length',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text('GIRTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0, bottom: 10.0),
                              child: TextField(
                                  controller: _girthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter girth',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                  onPressed: () {
                    var length_text = _lengthController.text;
                    var girth_text = _girthController.text;
                    double? length = double.tryParse(length_text);
                    double? girth = double.tryParse(girth_text);

                    if (length == null || girth == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("ERROR"),
                            content: const Text("Invalid input"),
                            actions: [
                              // ปุ่ม OK ใน dialog
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  // ปิด dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      double weight =
                          (girth / 100) * (girth / 100) * (length / 100) * 69.3;
                      double price = weight * 112.50;
                      double Tol_weight_max = (0.03 * weight) + weight;
                      double Tol_price_max = (0.03 * price) + price;
                      double Tol_weight_min = weight - (0.03 * weight);
                      double Tol_price_min = price - (0.03 * price);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/ic_pig.png',
                                      width: 30, height: 30),
                                  Text('  RESULT'),
                                ],
                              ),
                            ),
                            content: Text(
                                'Weight: ${Tol_weight_min.round()} - ${Tol_weight_max.round()} kg\nPrice: ${Tol_price_min.round()} - ${Tol_price_max.round()} Baht'),
                            actions: [
                              // ปุ่ม OK ใน dialog
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  // ปิด dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('CALCULATE')),
            ),
          ],
        ),
      ),
    );
  }
}