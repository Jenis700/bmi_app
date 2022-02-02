import 'package:bmi_app/Screens/ui_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/home__screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: UiHomeScreen(),
    );
  }
}
