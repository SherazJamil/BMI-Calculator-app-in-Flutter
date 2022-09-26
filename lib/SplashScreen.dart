import 'package:bmicalculator_app/Home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const HomeScreen(),
      duration: 5000,
      imageSize: 150,
      imageSrc: "assets/bmi.png",
      // text: "Flutter Dash",
      // textType: TextType.ColorizeAnimationText,
      // textStyle: const TextStyle(
      //   color: Colors.blueAccent,
      //   fontSize: 30.0,
      // ),
      backgroundColor: Colors.white,
    );
  }
}