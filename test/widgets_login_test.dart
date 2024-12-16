import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/login.dart';
import 'package:patrol_testing_app/screens/welcome.dart';

void main() {
  testWidgets('displays all required widgets', (WidgetTester tester) async {
    // Arrange & Act
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Assert
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.byKey(Key('usernameField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byKey(Key('signInButton')), findsOneWidget);
  });

  testWidgets('shows validation messages for empty fields',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act: Tap the sign-in button without filling fields
    await tester.tap(find.byKey(Key('signInButton')));
    await tester.pump(); // Trigger UI updates

    // Assert
    expect(find.text('Please enter your email'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('shows error for invalid email format',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act: Enter invalid email and tap sign-in
    await tester.enterText(find.byKey(Key('usernameField')), 'invalid-email');
    await tester.enterText(find.byKey(Key('passwordField')), 'Password123');
    await tester.tap(find.byKey(Key('signInButton')));
    await tester.pump();

    // Assert
    expect(find.text('Please enter a valid email address'), findsOneWidget);
  });

  testWidgets('shows error for invalid password', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act: Enter a valid email but an invalid password
    await tester.enterText(
        find.byKey(Key('usernameField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'short');
    await tester.tap(find.byKey(Key('signInButton')));
    await tester.pump();

    // Assert
    expect(find.text('Password must be at least 8 characters long'),
        findsOneWidget);
  });

  testWidgets('navigates to WelcomeScreen on successful login',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Act: Enter valid credentials and tap sign-in
    await tester.enterText(
        find.byKey(Key('usernameField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'Password123');
    await tester.tap(find.byKey(Key('signInButton')));
    await tester.pumpAndSettle(); // Wait for navigation

    // Assert: Verify navigation to WelcomeScreen
    expect(find.byType(WelcomeScreen), findsOneWidget);
    expect(find.text('Welcome, test@example.com!'), findsOneWidget);
  });
}
