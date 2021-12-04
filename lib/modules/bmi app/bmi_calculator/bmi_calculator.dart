import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groub/modules/bmi%20app/bmi_calculator/bmi_result/bmi_resultt.dart';
//import 'package:groub/modules/bmi_result/bmi_result_screen.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi Calculator',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.blue : Colors.grey),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male.png'),
                              width: 90,
                              height: 90,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale ? Colors.grey : Colors.blue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              width: 90,
                              height: 90,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'MALE',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' ${height.round()} ',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 200,
                      min: 80,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'weight',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(fontSize: 40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'age',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(fontSize: 40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                print(result.round());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                            isMale: isMale,
                            age: age,
                            result: result.round(),
                          )),
                );
              },
              child: Text(
                'calculate',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
