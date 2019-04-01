import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _ageControlller = TextEditingController();
  final TextEditingController _heightControlller = TextEditingController();
  final TextEditingController _weightControlller = TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String resultReading = "";

  String _finalResult = "";

  void calculateBMI() {
    setState(() {
      int age = int.parse(_ageControlller.text);
      double height = double.parse(_heightControlller.text);
      inches = height + 12;
      double weight = double.parse(_weightControlller.text);

      if ((_ageControlller.text.isNotEmpty || age > 0) &&
          (_heightControlller.text.isNotEmpty || inches > 0) &&
          (_weightControlller.text.isNotEmpty || weight > 0)) {
        result = weight / (inches * inches) * 703;

        //nentuin kelebihan berat
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          resultReading = "Underweight";
          print(resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25.0) {
          resultReading = " Great Shape";
          print(resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          resultReading = "Obese";
        }
      } else {
        result = 0.0;
      }
    });
    _finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            Image.asset(
              "img/bmilogo.png",
              height: 85.0,
              width: 75.0,
            ),
            Container(
              margin: const EdgeInsets.all(5.0),
              height: 250.0,
              width: 300.0,
              color: Colors.grey.shade400,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _ageControlller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "Misal : 34",
                        icon: Icon(Icons.person_outline)),
                  ),
                  TextField(
                    controller: _heightControlller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height in feet",
                        hintText: "Misal : 6.5",
                        icon: Icon(Icons.insert_chart)),
                  ),
                  TextField(
                    controller: _weightControlller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight in lbs",
                        hintText: "Misal : 180",
                        icon: Icon(Icons.line_weight)),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: calculateBMI,
                      color: Colors.pink,
                      child: Text("Calculate"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Text(
                  "$_finalResult",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "$resultReading",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
