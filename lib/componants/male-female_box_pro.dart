import 'package:bmi_app/Screens/ui_home_screen.dart';
import 'package:flutter/material.dart';

class BoxChildProperty extends StatelessWidget {
  const BoxChildProperty({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 150,
          color: iconColor,
        ),
        BoxNameText(nameText: text)
      ],
    );
  }
}
