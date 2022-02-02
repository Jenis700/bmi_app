import 'package:bmi_app/componants/male-female_box_pro.dart';
import 'package:bmi_app/constant.dart';
import 'package:flutter/material.dart';
import 'male_female_box_screen.dart';

enum Gender {
  male,
  female,
}

class UiHomeScreen extends StatefulWidget {
  const UiHomeScreen({Key? key}) : super(key: key);

  @override
  State<UiHomeScreen> createState() => _UiHomeScreenState();
}

class _UiHomeScreenState extends State<UiHomeScreen> {
  Gender? selectGender;
  int selectedTile = 0;
  double ans = 0;
  double height = 0;
  int weight = 0;
  int age = 0;

  String getInterpretationText() {
    if (ans >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (ans >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getInterpretationTextEmojis() {
    if (ans >= 25) {
      return '💪😵🚴🥴🏃😬🚵😵‍💫';
    } else if (ans >= 18.5) {
      return '🥳😍😇🤩😊🐯😎🦁';
    } else {
      return '🍲🍱🤪🍳🍗🤭🍒🍎';
    }
  }

  Color colors = Colors.black;
  String getMyText() {
    if (ans >= 0 && ans < 17) {
      colors = Colors.blue;
      return 'Please eat some healthy food!';
    } else if (ans >= 17 && ans <= 25) {
      colors = Colors.green;
      return 'Congratulation! You are perfectly fit!';
    } else if (ans >= 30) {
      colors = Colors.red;
      return 'You Must need to do some exercise!';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeH = MediaQuery.of(context).size.height * 0.23;
    double sizeW = MediaQuery.of(context).size.width * 0.45;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),

                //! male female box..........
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaleFemaleBox(
                      sizeH: sizeH,
                      sizeW: sizeW,
                      press: () {
                        setState(() {
                          selectGender = Gender.male;
                        });
                      },
                      colors: selectGender == Gender.male
                          ? kActiveColor
                          : kMainColor,
                      cardChild: BoxChildProperty(
                        iconColor: Colors.blue.shade300.withOpacity(0.8),
                        icon: Icons.male,
                        text: "MALE",
                      ),
                    ),
                    MaleFemaleBox(
                      sizeH: sizeH,
                      sizeW: sizeW,
                      press: () {
                        setState(() {
                          selectGender = Gender.female;
                        });
                      },
                      colors: selectGender == Gender.female
                          ? kActiveColor
                          : kMainColor,
                      cardChild: BoxChildProperty(
                        iconColor: Colors.red.withOpacity(0.7),
                        icon: Icons.female,
                        text: "FEMALE",
                      ),
                    ),
                  ],
                ),

                //! height box.................
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: sizeH,
                    width: sizeW * 2.1,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxNameText(nameText: "HEIGHT"),
                        Text(
                          "${height.round()}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: sizeW * 1.8,
                          child: Slider(
                            thumbColor: Colors.green,
                            min: 0.00,
                            value: height,
                            max: 215, //
                            label: "${height.round()}",
                            divisions: 215,
                            activeColor: Colors.amber[700],
                            onChanged: (newRating) {
                              setState(() {
                                height = newRating;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //! weight and age box.............
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //! Weight box............
                    Container(
                      height: sizeH,
                      width: sizeW,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxNameText(
                            nameText: 'WEIGHT',
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              weight == 0
                                  ? AddRemoveBtn(
                                      icon: Icons.remove,
                                      press: () {},
                                      color: Colors.amber.shade700
                                          .withOpacity(0.4),
                                    )
                                  : AddRemoveBtn(
                                      icon: Icons.remove,
                                      color: Colors.amber.shade700
                                          .withOpacity(0.8),
                                      press: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                              SizedBox(width: 10),
                              AddRemoveBtn(
                                icon: Icons.add,
                                color: Colors.amber.shade700.withOpacity(0.8),
                                press: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: sizeH,
                      width: sizeW,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxNameText(nameText: "AGE"),
                          Text(
                            "$age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              age == 0
                                  ? AddRemoveBtn(
                                      color: Colors.amber.shade700
                                          .withOpacity(0.4),
                                      icon: Icons.remove,
                                      press: () {},
                                    )
                                  : AddRemoveBtn(
                                      color: Colors.amber.shade700
                                          .withOpacity(0.8),
                                      icon: Icons.remove,
                                      press: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                              SizedBox(width: 10),
                              AddRemoveBtn(
                                color: Colors.amber.shade700.withOpacity(0.8),
                                icon: Icons.add,
                                press: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),

                //! bmi calculate button
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: 750,
                child: bottomDetailsSheet(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      minChildSize: 0.14,
      maxChildSize: 0.94,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[800],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "BMI = ${ans.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  getMyText(),
                  style: TextStyle(
                    color: colors,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  getInterpretationText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 0.5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  getInterpretationTextEmojis(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 10,
                  ),
                ),
                SizedBox(height: 20),
                DataTable(
                  dataRowHeight: 45,
                  // columnSpacing: 75,
                  border: const TableBorder(
                    verticalInside: BorderSide(color: Colors.black, width: 2),
                    horizontalInside: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    bottom: BorderSide(color: Colors.black, width: 2),
                  ),
                  columns: const [
                    DataColumn(
                        label: Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        letterSpacing: 1,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "BMI range\n  ( kg/m\u00B2 )",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        letterSpacing: 1,
                      ),
                    )),
                  ],
                  rows: [
                    //Todo: peli  row
                    DataRow(
                      cells: [
                        detaCellCategory("Mild Thinness", 0.00, 16, Colors.blue,
                            Colors.white70),
                        dataCellBmiRange(
                            "< 16", 0.00, 16, Colors.blue, Colors.white70),
                      ],
                    ),

                    //Todo: biji row
                    DataRow(
                      cells: [
                        detaCellCategory("Moderate Thinness", 16, 17,
                            Colors.blue, Colors.white70),
                        dataCellBmiRange(
                            "16 - 17", 16, 17, Colors.blue, Colors.white70),
                      ],
                    ),

                    //Todo: 3 row
                    DataRow(
                      cells: [
                        detaCellCategory("Mild Thinness", 17, 18.5, Colors.blue,
                            Colors.white70),
                        dataCellBmiRange(
                            "17 - 18.5", 17, 18.5, Colors.blue, Colors.white70),
                      ],
                    ),

                    //Todo: 4 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "Normal", 18.5, 25, Colors.green, Colors.white70),
                        dataCellBmiRange("18.5 - 25", 18.5, 25, Colors.green,
                            Colors.white70),
                      ],
                    ),

                    //Todo: 5 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "OverWeight", 25, 30, Colors.red, Colors.white70),
                        dataCellBmiRange(
                            "25 - 30", 25, 30, Colors.red, Colors.white70),
                      ],
                    ),

                    //Todo: 6 row
                    DataRow(
                      cells: [
                        detaCellCategory("Obese Class 1", 30, 35, Colors.red,
                            Colors.white70),
                        dataCellBmiRange(
                            "30 - 35", 30, 35, Colors.red, Colors.white70),
                      ],
                    ),

                    //Todo: 7 row
                    DataRow(
                      cells: [
                        detaCellCategory("Obese Class 2", 35, 40, Colors.red,
                            Colors.white70),
                        dataCellBmiRange(
                            "35 - 40", 35, 40, Colors.red, Colors.white70),
                      ],
                    ),

                    //Todo: 8 row
                    DataRow(
                      cells: [
                        detaCellCategory("Obese Class 3", 40.00, 100,
                            Colors.red, Colors.white70),
                        dataCellBmiRange(
                            "35 - 40", 40.00, 100, Colors.red, Colors.white70),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BmiButton(
                  press: () {
                    setState(() {
                      double value = height / 100;

                      double totalHeight = value * value;

                      ans = weight / totalHeight;

                      print("Ans is :::::::::::::::::::::::::::::::::  $ans");
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

//!data cell bmi range
  DataCell dataCellBmiRange(
      String text, double first, double secound, Color color1, Color color2) {
    return DataCell(
      Text(
        text,
        style: TextStyle(
          color: ans >= first && ans < secound ? color1 : color2,
          fontSize: ans >= first && ans < secound ? 18 : 16,
          fontWeight: ans >= first && ans < secound
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

//! data cell category
  DataCell detaCellCategory(
      String text, double first, double secound, Color color1, color2) {
    return DataCell(
      Text(
        text,
        style: TextStyle(
          color: ans >= first && ans < secound ? color1 : color2,
          fontSize: ans >= first && ans < secound ? 18 : 16,
          fontWeight: ans >= first && ans < secound
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}

//! add ane remove buttons.......
class AddRemoveBtn extends StatelessWidget {
  const AddRemoveBtn({
    Key? key,
    required this.icon,
    required this.press,
    this.color = Colors.amber,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}

//! calculate BMI button...........
class BmiButton extends StatelessWidget {
  const BmiButton({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
          Colors.amber.shade700.withOpacity(0.85),
        )),
        child: Text(
          "CALCULATE BMI",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: press,
      ),
    );
  }
}

//! male, female, weight & age names.....
class BoxNameText extends StatelessWidget {
  const BoxNameText({
    Key? key,
    required this.nameText,
  }) : super(key: key);
  final String nameText;

  @override
  Widget build(BuildContext context) {
    return Text(
      nameText,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 20,
      ),
    );
  }
}
