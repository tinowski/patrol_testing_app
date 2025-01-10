import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/my_details.dart';

void main() {
  testWidgets('Renders MyDetailsScreen with initial expanded state',
      (WidgetTester tester) async {
    // Pump the widget
    await tester.pumpWidget(
      MaterialApp(
        home: MyDetailsScreen(),
      ),
    );

    // Verify Basic Info is rendered and initially expanded
    expect(find.text('Basic Info'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget); // Inside expanded section
    expect(find.text('Surname'), findsOneWidget);
    expect(find.text('Date of Birth'), findsOneWidget);
  });

  testWidgets('Collapsing and expanding Basic Info works correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyDetailsScreen(),
      ),
    );

    // Tap on the expansion toggle
    final toggleIcon = find.byIcon(Icons.expand_less);
    expect(toggleIcon, findsOneWidget);

    await tester.tap(toggleIcon);
    await tester.pumpAndSettle();

    // Verify Basic Info is collapsed
    expect(find.text('Name'), findsNothing); // Inside collapsed section
    expect(find.text('Surname'), findsNothing);

    // Expand again
    final expandIcon = find.byIcon(Icons.expand_more);
    expect(expandIcon, findsOneWidget);

    await tester.tap(expandIcon);
    await tester.pumpAndSettle();

    // Verify Basic Info is expanded again
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Surname'), findsOneWidget);
  });

  testWidgets('Save button displays a snackbar on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyDetailsScreen(),
      ),
    );

    // Tap on the Save button
    final saveButton = find.text('Save');
    expect(saveButton, findsOneWidget);

    await tester.tap(saveButton);
    await tester.pump(); // Trigger Snackbar animation

    // Verify Snackbar message
    expect(find.text('Details saved!'), findsOneWidget);
  });
}
