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

// This is a custom widget that extends StatefulWidget, which means it can maintain state that can change over time.
class ReusableButton extends StatefulWidget {
  // Constructor for this widget. It takes an optional key that can be used to control or reference this widget.
  const ReusableButton({Key? key}) : super(key: key);

  // This method is overridden from StatefulWidget. It creates the mutable state for this widget.
  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

// This is the state object for the ReusableButton widget. It's created by the createState method above.
class _ReusableButtonState extends State<ReusableButton> {
  // This is a state that this widget maintains. It's the number that's displayed on the button.
  int currentNumOnButton = 1;

  // This method is overridden from State. It describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // Padding is a widget that insets its child by the given padding.
    return Padding(
      // EdgeInsets.all(8.0) means to apply 8.0 pixels of padding in each direction: left, top, right, and bottom.
      padding: const EdgeInsets.all(8.0),
      // ElevatedButton is a Material Design raised button. A filled button whose material elevates when pressed.
      child: ElevatedButton(
        // Provides a callback that is called when the button is tapped or otherwise activated.
        onPressed: () {
          // Call setState to indicate that this widget's state has changed. This will cause this widget to rebuild.
          setState(() {
            // Increment the number on the button.
            currentNumOnButton++;
          });
        },
        // This is the widget displayed on the button. It's a text widget that displays the current number.
        child: Text('${currentNumOnButton.toString()}, press to increase'),
      ),
    );
  }
}

// This is a custom widget that extends StatelessWidget, which means it's immutable and can't maintain state that can change over time.
class ReusableTextStyle extends StatelessWidget {
  // Constructor for this widget. It takes a key, text, color, and fontsize as parameters.
  // The 'required' keyword means that these parameters must be provided when creating this widget.
  const ReusableTextStyle(
      {Key?
          key, // This is an identifier for this widget. It's optional and can be used to reference this widget.
      required this.text, // This is the text that will be displayed by this widget.
      required this.color, // This is the color of the text.
      required this.fontsize}) // This is the size of the text.
      : super(
            key:
                key); // This calls the constructor of the superclass (StatelessWidget) with the provided key.

  // These are properties of this widget. They're final because this widget is immutable.
  final String text;
  final Color color;
  final double fontsize;

  // This method is overridden from StatelessWidget. It describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    // Text is a widget that displays a short, simple piece of text.
    return Text(
      text, // This is the text that will be displayed.
      style: TextStyle(
          // TextStyle is a way to describe the style of the text.
          fontSize: fontsize, // This sets the size of the text.
          fontWeight: FontWeight.bold, // This makes the text bold.
          color: color), // This sets the color of the text.
    );
  }
}
