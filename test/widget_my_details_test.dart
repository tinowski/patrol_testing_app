import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/my_details.dart';

void main() {
  testWidgets('expands and collapses each section',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyDetailsScreen()));

    // Basic Info is expanded by default
    expect(find.byKey(Key('nameField')), findsOneWidget);

    // Collapse Basic Info
    await tester.tap(find.byKey(Key('basicInfoHeader')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('nameField')), findsNothing);

    // Expand Availability
    await tester.tap(find.byKey(Key('availabilityHeader')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('startingDateField')), findsOneWidget);

    // Expand Physical Details
    await tester.tap(find.byKey(Key('physicalDetailsHeader')));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('heightField')), findsOneWidget);
  });
}
