import 'package:flutter/material.dart';
import './../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.only(top: 8.0),
        width: double.infinity,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: KLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
