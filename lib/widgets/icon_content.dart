import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          height: 16.0,
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 16.0, color: Color(0XFF8D8E98)),
        ),
      ],
    );
  }
}
