import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPress});
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(height: 44.0, width: 44.0),
      elevation: 4.0,
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPress,
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
