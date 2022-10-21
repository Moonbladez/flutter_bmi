import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer(
      {super.key,
      required this.bgColour,
      required this.cardChild,
      this.onPress});

  final Color bgColour;
  final Widget cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: bgColour,
          borderRadius: BorderRadius.circular(8),
        ),
        child: cardChild,
      ),
    );
  }
}
