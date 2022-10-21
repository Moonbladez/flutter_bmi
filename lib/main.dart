import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/screens/results_screen.dart';

import "./screens/input_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          inactiveTrackColor: const Color(0xFF8D8E98),
          thumbColor: const Color(0xFFEB1555),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: const Color(0X29EB1555),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0A0E21),
          secondary: const Color(0xFFEB1555),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        cardTheme: const CardTheme(
          color: Color(0XFF1D1E33),
          margin: EdgeInsets.all(16.0),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const InputScreen(),
        "/results": (context) => ResultsScreen(
              bmiResult: "",
              resultText: "",
              interpretation: "",
            )
      },
    );
  }
}
