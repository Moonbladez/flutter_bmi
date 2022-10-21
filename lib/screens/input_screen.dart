import 'package:flutter/material.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/card.dart';
import '../widgets/icon_content.dart';
import "./../widgets/primary_button.dart";
import "./results_screen.dart";
import "./../constants.dart";
import "./../calculator.dart";

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int age = 30;
  int height = 160;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                      bgColour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                          icon: Icon(
                            Icons.male_outlined,
                            size: 80.0,
                          ),
                          label: "male"),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onPress: () {
                        setState(
                          () {
                            selectedGender = Gender.female;
                          },
                        );
                      },
                      bgColour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const IconContent(
                        icon: Icon(
                          Icons.female_sharp,
                          size: 80,
                        ),
                        label: "female",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height".toUpperCase(),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      value: height.toDouble(),
                    ),
                  ],
                ),
                bgColour: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Weight".toUpperCase(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPress: () {
                                    setState(
                                      () {
                                        weight--;
                                      },
                                    );
                                  },
                                  icon: Icons.horizontal_rule_rounded),
                              const SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      bgColour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "age".toUpperCase(),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPress: () {
                                    setState(
                                      () {
                                        age--;
                                      },
                                    );
                                  },
                                  icon: Icons.horizontal_rule_rounded),
                              const SizedBox(
                                width: 12.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onPress: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      bgColour: kActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              text: "Calculate BMI",
              onTap: () {
                Calculator calc = Calculator(weight: weight, height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(
                      bmiResult: calc.caculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpritation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
