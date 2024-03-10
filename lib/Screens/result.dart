import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.result, required this.bmi_result});
  final double result ;
  final String bmi_result;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Result",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(10.0),
              width: screenWidth,
              height: screenheight / 2,
              decoration: BoxDecoration(
                color: colorwithopacity,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Your BMI is",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        widget.bmi_result,
                        style: const TextStyle(
                          color: color,
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      widget.result.toStringAsFixed(2),
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
                    value: widget.result,
                    onChanged: (value) {
                    },
                    min: 0,
                    max: 60,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "UnderWeight",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500),
                  ),
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "https://img.freepik.com/free-vector/flat-woman-diet-control-normal-weight-with-bmi-scale_88138-933.jpg?w=996&t=st=1710063885~exp=1710064485~hmac=ab0ced12caed58098a148490405cf4439f847f0104964c31a4a03c34f56eb99c",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
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
                    "Re-Calculate",
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
