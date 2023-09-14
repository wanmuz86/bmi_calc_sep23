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
      home: const HomePage(),
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
  var _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const Text("BMI Calculator", style: TextStyle(fontSize: 32, color: Colors.red),),
            const SizedBox(height: 8,),
            const Text("We care about your health", style: TextStyle(fontSize: 24),),
            const SizedBox(height: 8,),
            Image.asset("assets/bmi_calc.jpg"),
            const SizedBox(height: 8,),
            Text("Height (${_heightSliderValue.round()} cm)", style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 8,),
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
            Text("Weight ${_weightSliderValue.round()} kg)",
              style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 8,),
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
            const SizedBox(height: 8,),
            _bmi != 0 ? Text("Your BMI is $_bmi") : const SizedBox(),
            const SizedBox(height: 8,),
            Text(_message),// $ and ${ } is to bring out variable
            const SizedBox(height: 8,),
            TextButton.icon(
                onPressed: () {
                  // ( weight in kg / (height in metre)^2) = bmi

                  var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100),2);

                  // ONLY Assigning bmiTemp.round() into _bmi variable
                 // _bmi = bmiTemp.round();

                  // Assigning  bmiTemp.round() into _bmi variable
                  // The widget to be refreshed

                  var messageTemp = "";

                  if (bmiTemp < 18){
                    messageTemp = "You are underweight";
                  }
                  else if (bmiTemp < 25){
                    messageTemp = "You are normal";
                  }
                  else if (bmiTemp < 30){
                    messageTemp = "You are overweight";
                  }
                  else {
                    messageTemp = "You are obese";
                  }

                  setState(() {
                    // _bmi => int
                    // bmiTemp => double
                    // integer = double
                    // in order to assign bmiTemp into _bmi, I have to transform it to int
                    _bmi = bmiTemp.round();
                    _message = messageTemp;
                  });

                },
                icon: const Icon(Icons.favorite),
                label: const Text("Calculate"))
          ],
        )),
      ),
    );
  }
}
