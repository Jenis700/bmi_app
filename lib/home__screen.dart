import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightControleer = TextEditingController();

  TextEditingController weightControleer = TextEditingController();

  double ans = 0;

  late FocusNode myFocusNode;

  bool selectedItem = true;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculation"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //! male female boxes
                const MaleF(),
                const SizedBox(height: 15),

                //! height weight boxes
                HeightWeight(
                  height: heightControleer,
                  weight: weightControleer,
                ),
                const SizedBox(height: 20),

                //! bmi Btn
                bmiCalculateBtn(),
                const SizedBox(height: 13),
                Text(
                  "BMI  =  ${ans.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ans < 25 ? Colors.green : Colors.deepPurple,
                  ),
                ),
                ans >= 0 && ans < 17
                    ? const Text(
                        "Please eat some healthy food!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "Please eat some healthy food!",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5), fontSize: 10),
                      ),
                ans >= 17 && ans <= 25
                    ? const Text(
                        "Congratulation! You are perfectly fit!",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "Congratulation! You are perfectly fit!",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5), fontSize: 10),
                      ),

                ans >= 30
                    ? const Text(
                        "You Must need to do some exercise!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "You Must need to do some exercise!",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5), fontSize: 10),
                      ),
                const SizedBox(height: 15),

                //! data table
                DataTable(
                  dataRowHeight: 45,
                  // columnSpacing: 75,
                  border: const TableBorder(
                    verticalInside: BorderSide(color: Colors.black),
                    horizontalInside: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                    bottom: BorderSide(color: Colors.black),
                  ),
                  columns: const [
                    DataColumn(
                        label: Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "BMI range\n  ( kg/m\u00B2 )",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    )),
                  ],
                  rows: [
                    //Todo: peli  row
                    DataRow(
                      cells: [
                        detaCellCategory("Mild Thinness", 0.00, 16, Colors.blue,
                            Colors.black),
                        dataCellBmiRange(
                            "< 16", 0.00, 16, Colors.blue, Colors.black),
                      ],
                    ),

                    //Todo: biji row
                    DataRow(
                      cells: [
                        detaCellCategory("Moderate Thinness", 16, 17,
                            Colors.blue, Colors.black),
                        dataCellBmiRange(
                            "16 - 17", 16, 17, Colors.blue, Colors.black),
                      ],
                    ),

                    //Todo: 3 row
                    DataRow(
                      cells: [
                        detaCellCategory("Mild Thinness", 17, 18.5, Colors.blue,
                            Colors.black),
                        dataCellBmiRange(
                            "17 - 18.5", 17, 18.5, Colors.blue, Colors.black),
                      ],
                    ),

                    //Todo: 4 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "Normal", 18.5, 25, Colors.green, Colors.black),
                        dataCellBmiRange(
                            "18.5 - 25", 18.5, 25, Colors.green, Colors.black),
                      ],
                    ),

                    //Todo: 5 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "OverWeight", 25, 30, Colors.red, Colors.black),
                        dataCellBmiRange(
                            "25 - 30", 25, 30, Colors.red, Colors.black),
                      ],
                    ),

                    //Todo: 6 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "Obese Class 1", 30, 35, Colors.red, Colors.black),
                        dataCellBmiRange(
                            "30 - 35", 30, 35, Colors.red, Colors.black),
                      ],
                    ),

                    //Todo: 7 row
                    DataRow(
                      cells: [
                        detaCellCategory(
                            "Obese Class 2", 35, 40, Colors.red, Colors.black),
                        dataCellBmiRange(
                            "35 - 40", 35, 40, Colors.red, Colors.black),
                      ],
                    ),

                    //Todo: 8 row
                    DataRow(
                      cells: [
                        detaCellCategory("Obese Class 3", 40.00, 100,
                            Colors.red, Colors.black),
                        dataCellBmiRange(
                            "35 - 40", 40.00, 100, Colors.red, Colors.black),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
          fontSize: ans >= 18.5 && ans < secound ? 16 : 15,
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
          fontSize: ans >= first && ans < secound ? 16 : 15,
          fontWeight: ans >= first && ans < secound
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

  SizedBox bmiCalculateBtn() {
    return SizedBox(
      height: 40,
      width: 120,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Colors.black.withOpacity(0.5)),
          backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
        ),
        onPressed: () {
          setState(() {
            double weight = double.parse(weightControleer.text);
            double height = double.parse(heightControleer.text);
            double miterHeight = height / 100;

            double totalHeight = miterHeight * miterHeight;

            ans = weight / totalHeight;
          });
        },
        child: const Text("BMI"),
      ),
    );
  }
}

//! for height weight boxes
class HeightWeight extends StatelessWidget {
  const HeightWeight({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  final TextEditingController height;
  final TextEditingController weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: height,
            style: const TextStyle(fontSize: 18),
            cursorHeight: 25,
            cursorWidth: 2.5,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.deepOrange, width: 2),
              ),
              hintText: " Height",
            ),
          ),
        ),
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.6),
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: weight,
            style: const TextStyle(fontSize: 18),
            cursorHeight: 25,
            cursorWidth: 2.5,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: " Weight",
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.deepOrange, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//! for male female box
class MaleF extends StatefulWidget {
  const MaleF({Key? key}) : super(key: key);

  @override
  _MaleFState createState() => _MaleFState();
}

class _MaleFState extends State<MaleF> {
  var _isMale = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderSelect(gender: "Male", selected: _isMale),
        _buildGenderSelect(gender: "Female", selected: !_isMale),
      ],
    );
  }

  Widget _buildGenderSelect({required String gender, required bool selected}) {
    var button = selected
        ? _buildSelect(
            text: gender, textColor: Colors.black, background: Colors.grey)
        : _buildSelect(
            text: gender,
            textColor: Colors.white,
            background: Colors.deepOrange);

    return GestureDetector(
      child: button,
      onTap: () {
        setState(() {
          _isMale = !_isMale;
        });
      },
    );
  }

  Container _buildSelect(
      {required String text,
      required Color background,
      required Color textColor}) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      width: 100,
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 18, color: textColor),
      )),
    );
  }
}
