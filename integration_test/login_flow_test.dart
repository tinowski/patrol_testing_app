import 'package:flutter/material.dart'; // Import for Text and other widgets
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_testing_app/main.dart';

void main() {
  patrolTest('Login validations and successful sign-in flow', ($) async {
    // Launch the app
    await $.pumpWidgetAndSettle(MyApp());

    // Verify the login screen elements
    expect($(#usernameField).exists, true);
    expect($(#passwordField).exists, true);
    expect($(#signInButton).exists, true);

    // Test empty username and password
    await $(#signInButton).tap();
    await $.tester.pumpAndSettle();

    // Check validation error for username
    final usernameErrorFinder = find.descendant(
      of: find.byKey(Key('usernameField')),
      matching: find.text('Please enter your email'),
    );
    expect(usernameErrorFinder, findsOneWidget);

    // Check validation error for password
    final passwordErrorFinder = find.descendant(
      of: find.byKey(Key('passwordField')),
      matching: find.text('Please enter your password'),
    );
    expect(passwordErrorFinder, findsOneWidget);

    // Test invalid email
    await $(#usernameField).enterText('invalid-email');
    await $(#passwordField).enterText('password123');
    await $(#signInButton).tap();
    await $.tester.pumpAndSettle();
    expect(find.text('Please enter a valid email address'), findsOneWidget);

    // Test password too short
    await $(#usernameField).enterText('user@example.com');
    await $(#passwordField).enterText('short');
    await $(#signInButton).tap();
    await $.tester.pumpAndSettle();
    expect(find.text('Password must be at least 8 characters long'),
        findsOneWidget);

    // Test password missing numbers
    await $(#passwordField).enterText('password');
    await $(#signInButton).tap();
    await $.tester.pumpAndSettle();
    expect(find.text('Password must contain both letters and numbers'),
        findsOneWidget);

    // Test valid inputs and successful sign-in
    await $(#usernameField).enterText('user@example.com');
    await $(#passwordField).enterText('password123');
    await $(#signInButton).tap();
    await $.tester.pumpAndSettle();

    // Verify the welcome screen
    expect($(#welcomeMessage).exists, true);
    expect($(#welcomeMessage).text, 'Hello user@example.com');
  });
}
