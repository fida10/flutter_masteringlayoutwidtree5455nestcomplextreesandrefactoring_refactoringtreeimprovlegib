/*
Practice Question 2: Refactoring a Widget Tree for Improved Legibility

Task Description:
Refactor the widget tree in your Flutter application to improve legibility and maintainability. Extract repetitive or complex parts of the widget tree into separate reusable widgets. For instance, if there are multiple similar button designs or text styles, create a separate widget for these and reuse them in the main widget tree.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  int currentNumOnButton = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ReusableTextStyle(
            text: 'This text is the title of the main column',
            color: Colors.pink,
            fontsize: 24,
          ),
          Container(
            color: Colors.grey,
            width: 100,
            height: 100,
            child: const Text('This is some text within the container'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ReusableTextStyle(
                    text:
                        'This text is for the first field, it comes from a refactored widget class',
                    color: Colors.blue,
                    fontsize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ReusableButton(),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
//code is the same as the previous question

class ReusableButton extends StatefulWidget {
  const ReusableButton({super.key});

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  int currentNumOnButton = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            currentNumOnButton++;
          });
        },
        child: Text('${currentNumOnButton.toString()}, press to increase'),
      ),
    );
  }
}

class ReusableTextStyle extends StatelessWidget {
  const ReusableTextStyle(
      {super.key,
      required this.text,
      required this.color,
      required this.fontsize});

  final String text;
  final Color color;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
