import 'dart:math';
import 'package:bmicalculator_app/Gender.dart';
import 'package:bmicalculator_app/Height.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'AgeWeight.dart';
import 'Score.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int gender = 0;
  int age = 0;
  int height = 0;
  int weight = 0;
  bool isFinished = false;
  double bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 6,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  GenderWidget(
                      onChange: (genderVal) {
                        gender = genderVal;
                      },
                  ),
                  HeightWidget(
                      onChange: (heightVal) {
                        height = heightVal;
                      }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            age = ageVal;
                          },
                          title: "Age",
                          initValue: 25,
                          min: 0,
                          max: 100),
                      AgeWeightWidget(
                          onChange: (weightVal) {
                            weight = weightVal;
                          },
                          title: "Weight(Kg)",
                          initValue: 50,
                          min: 0,
                          max: 250)
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 60
                      ),
                    child: SwipeableButtonView(
                      isFinished: isFinished,
                      onFinish: () async {
                        await Navigator.push(context, PageTransition(
                          child: ScoreScreen(
                            bmiScore = bmiScore,
                            age = age,
                            age: age,
                            bmiScore: bmiScore,
                          ),
                          type: PageTransitionType.fade
                        ));
                        setState(() {
                          isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        calculateBmi();
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.amber,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "Calculate",
                      buttontextstyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void calculateBmi() {
    bmiScore = weight / pow(height / 100, 2);
  }
}