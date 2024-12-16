import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/custom_drawer.dart';

void main() {
  const testUsername = 'John Doe';

  testWidgets('CustomDrawer renders all elements with keys',
      (WidgetTester tester) async {
    // Arrange: Scaffold with AppBar and Drawer
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Test Drawer'),
          ),
          drawer: CustomDrawer(username: testUsername),
        ),
      ),
    );

    // Act: Open the drawer
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pump(); // Wait for the drawer to open

    // Assert: Verify all keys are present
    expect(find.byKey(Key('customDrawer')), findsOneWidget);
    expect(find.byKey(Key('drawerHeader')), findsOneWidget);
    expect(find.byKey(Key('drawerUsername')), findsOneWidget);
    expect(find.byKey(Key('myDetailsTile')), findsOneWidget);
    expect(find.byKey(Key('logoutTile')), findsOneWidget);
  });
}
