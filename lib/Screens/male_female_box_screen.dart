import 'package:bmi_app/componants/male-female_box_pro.dart';
import 'package:flutter/material.dart';

import 'ui_home_screen.dart';

//! male and female box
class MaleFemaleBox extends StatelessWidget {
  const MaleFemaleBox({
    Key? key,
    required this.sizeH,
    required this.sizeW,
    required this.press,
    required this.colors,
    required this.cardChild,
  }) : super(key: key);

  final double sizeH;
  final double sizeW;
  final VoidCallback press;
  final Color? colors;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: sizeH,
        width: sizeW,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(15),
        ),
        child: cardChild,
      ),
    );
  }
}
