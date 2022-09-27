import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatelessWidget {

  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

   ScoreScreen(double d, int i, {Key? key,
    required this.bmiScore,
    required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretration();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 6,
        centerTitle: true,
        title: const Text(
            "BMI Score",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 15,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Score',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              PrettyGauge(
                gaugeSize: 300,
                minValue: 0,
                maxValue: 40,
                segments: [
                  GaugeSegment('UnderWeight', 18.5, Colors.red),
                  GaugeSegment('Normal', 6.4, Colors.green),
                  GaugeSegment('OverWeight', 5, Colors.orange),
                  GaugeSegment('Obese', 10.1, Colors.pink),
                ],
                valueWidget: Text(
                  bmiScore.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                currentValue: bmiScore.toDouble(),
                needleColor: Colors.blue,
              ),
          const SizedBox(
            height: 10,
          ),
          Text(
            bmiStatus!,
            style: TextStyle(
                fontSize: 20,
                color: bmiStatusColor!,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            bmiInterpretation!,
            style: const TextStyle(
                fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                        "Re-calculate",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber
                  ),
                    onPressed: () {
                      Share.share(
                          "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                    },
                    child: const Text(
                        "Share",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
              ]))),
            //],
          );
        }
  void setBmiInterpretration() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce your weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase your weight";
      bmiStatusColor = Colors.red;
    }
  }
}