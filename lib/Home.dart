import 'package:bmicalculator_app/Gender.dart';
import 'package:bmicalculator_app/Height.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: const Color(0xFF1DBF73),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Card(
            shape: const RoundedRectangleBorder(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
