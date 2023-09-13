import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightSliderValue = 170; // private property
  double _weightSliderValue = 70; // Declaring with data type -> explicit declaration
  var _bmi = 0; // declaring var -> implicit declaration
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("BMI Calculator", style: TextStyle(fontSize: 32, color: Colors.red),),
          SizedBox(height: 8,),
          Text("We care about your health", style: TextStyle(fontSize: 24),),
          SizedBox(height: 8,),
          Image.asset("assets/bmi_calc.jpg"),
          SizedBox(height: 8,),
          Text("Height (${_heightSliderValue.round()} cm)", style: TextStyle(fontSize: 24),),
          SizedBox(height: 8,),
          // Slider
          Slider(
            value: _heightSliderValue,
            min:50,
            max: 200,
            onChanged: (double value) {
              setState(() {
                _heightSliderValue = value;
              });
            },
          ),
          Text("Weight (${_weightSliderValue.round()} kg)",
            style: TextStyle(fontSize: 24),),
          SizedBox(height: 8,),
          // Slider
          Slider(
            value: _weightSliderValue,
            max: 180,
            min:40,
            onChanged: (double value) {
              setState(() {
                _weightSliderValue = value;
              });
            },
          ),
          SizedBox(height: 8,),
          Text("Your BMI is $_bmi"), // $ and ${ } is to bring out variable
          TextButton.icon(
              onPressed: () {
                // ( weight in kg / (height in metre)^2) = bmi

                var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100),2);
                print(bmiTemp);
                // ONLY Assigning bmiTemp.round() into _bmi variable
               // _bmi = bmiTemp.round();

                // Assigning  bmiTemp.round() into _bmi variable
                // The widget to be refreshed

                setState(() {
                  _bmi = bmiTemp.round();
                });

              },
              icon: Icon(Icons.favorite),
              label: Text("Calculate"))
        ],
      )),
    );
  }
}
