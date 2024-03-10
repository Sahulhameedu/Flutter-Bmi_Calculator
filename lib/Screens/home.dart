import 'dart:math';

import 'package:bmi_calculator/Screens/result.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variables
  double height = 150;
  //methods
  int ageVar = 18;
  int weightVar = 50;
  bool gender = true;
  double calculateBmi() {
    height = height / 100;
    return weightVar / pow(height, 2);
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.width;
    const Color color = Color.fromARGB(255, 218, 253, 135);
    const Color colorwithopacity = Color.fromARGB(255, 43, 43, 43);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: const Icon(
          Icons.monitor_weight,
          color: color,
          size: 40.0,
        ),
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = true;
                    });
                  },
                  child: Container(
                    width: screenWidth / 2.23,
                    height: screenheight / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: gender
                          ? colorwithopacity
                          : const Color.fromARGB(100, 43, 43, 43),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: color,
                            size: 40.0,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "MALE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = false;
                    });
                  },
                  child: Container(
                    width: screenWidth / 2.23,
                    height: screenheight / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: !gender
                          ? colorwithopacity
                          : const Color.fromARGB(100, 43, 43, 43),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: color,
                            size: 40.0,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(10.0),
              width: screenWidth,
              height: screenheight / 2,
              decoration: BoxDecoration(
                color: colorwithopacity,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: color,
                        ),
                        child: const Center(
                            child: Text(
                          "cm",
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      height.toStringAsFixed(0),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Slider(
                    activeColor: const Color.fromARGB(255, 54, 50, 50),
                    thumbColor: color,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    min: 40,
                    max: 300,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth / 2.23,
                  height: screenheight / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: colorwithopacity,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (weightVar > 1) {
                                  setState(() {
                                    weightVar = weightVar - 1;
                                  });
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: color,
                                ),
                                child: const Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(
                              weightVar.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  weightVar = weightVar + 1;
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: color,
                                ),
                                child: const Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "kg",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screenWidth / 2.23,
                  height: screenheight / 2.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: colorwithopacity,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (ageVar > 1) {
                                  setState(() {
                                    ageVar = ageVar - 1;
                                  });
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: color,
                                ),
                                child: const Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            Text(
                              ageVar.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (ageVar < 100) {
                                  setState(() {
                                    ageVar = ageVar + 1;
                                  });
                                }
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: color,
                                ),
                                child: const Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Year",
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                double bmi = calculateBmi();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      result: bmi,
                      bmi_result: interpretBMI(bmi),
                    ),
                  ),
                );
                setState(() {
                  height = 150.0;
                  weightVar =50;
                  ageVar = 18;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: screenWidth,
                height: screenheight / 6,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
