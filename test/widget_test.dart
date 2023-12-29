import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:masteringlayoutwidtree5455nestcomplextreesandrefactoring_refactoringtreeimprovlegib/main.dart';

void main() {
  testWidgets('Refactoring Widget Tree Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); // Replace with your main app widget

    // Test for the presence of the newly created reusable widgets
    expect(find.byType(ReusableButton),
        findsWidgets); // Replace with your custom widget name
    expect(find.byType(ReusableTextStyle),
        findsWidgets); // Replace with your custom widget name

    // Verify that the reusable widgets are being used in the expected places
    // For instance, checking if ReusableButton is found in a specific part of the app
  });
}
