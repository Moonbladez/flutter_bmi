import 'package:flutter/material.dart';
import './../constants.dart';
import './../widgets/card.dart';
import './../widgets/primary_button.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Results"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CardContainer(
                bgColour: kActiveCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: const TextStyle(
                          letterSpacing: 1.5,
                          color: Color(0XFF24D876),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(bmiResult, style: kNumberTextStyle),
                    Text(
                      interpretation,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            PrimaryButton(
              text: "Re-Calculate",
              onTap: () {
                Navigator.pop(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
