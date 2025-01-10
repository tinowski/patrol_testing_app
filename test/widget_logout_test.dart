import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/login.dart';
import 'package:patrol_testing_app/screens/logout.dart';

void main() {
  testWidgets('displays CircularProgressIndicator while logging out',
      (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      MaterialApp(
        home: LogoutScreen(),
      ),
    );

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('navigates to LoginScreen after logout logic',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LogoutScreen(),
      ),
    );

    // Act: Simulate the passage of time
    await tester.pumpAndSettle();

    // Assert: Verify that LoginScreen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
