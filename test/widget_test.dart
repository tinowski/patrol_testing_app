import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_testing_app/screens/login.dart';
import 'package:patrol_testing_app/screens/welcome.dart';

void main() {
  group('Widget Tests', () {
    testWidgets('Login screen renders correctly', (WidgetTester tester) async {
      // Build the LoginScreen widget
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Verify all key elements exist
      expect(find.byKey(Key('usernameField')), findsOneWidget);
      expect(find.byKey(Key('passwordField')), findsOneWidget);
      expect(find.byKey(Key('signInButton')), findsOneWidget);

      // Verify welcome message does not exist initially
      expect(find.text('Hello, user@example.com!'), findsNothing);
    });

    testWidgets('Login screen validation messages are displayed',
        (WidgetTester tester) async {
      // Build the LoginScreen widget
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Tap the Sign In button without entering any data
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();

      // Verify validation error messages
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('Invalid email shows correct validation message',
        (WidgetTester tester) async {
      // Build the LoginScreen widget
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Enter an invalid email
      await tester.enterText(find.byKey(Key('usernameField')), 'invalid-email');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();

      // Verify invalid email message
      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('Password validation messages are displayed correctly',
        (WidgetTester tester) async {
      // Build the LoginScreen widget
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Enter valid email but invalid password
      await tester.enterText(
          find.byKey(Key('usernameField')), 'user@example.com');

      // Enter a short password
      await tester.enterText(find.byKey(Key('passwordField')), 'short');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();
      expect(find.text('Password must be at least 8 characters long'),
          findsOneWidget);

      // Enter a password without numbers
      await tester.enterText(find.byKey(Key('passwordField')), 'password');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();
      expect(find.text('Password must contain both letters and numbers'),
          findsOneWidget);

      // Enter a password without letters
      await tester.enterText(find.byKey(Key('passwordField')), '12345678');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();
      expect(find.text('Password must contain both letters and numbers'),
          findsOneWidget);
    });

    testWidgets('Successful sign-in navigates to welcome screen',
        (WidgetTester tester) async {
      // Build the LoginScreen widget
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Enter valid credentials
      await tester.enterText(
          find.byKey(Key('usernameField')), 'user@example.com');
      await tester.enterText(find.byKey(Key('passwordField')), 'password123');
      await tester.tap(find.byKey(Key('signInButton')));
      await tester.pumpAndSettle();

      // Verify navigation to WelcomeScreen
      expect(find.byType(WelcomeScreen), findsOneWidget);
      expect(find.text('Hello, user@example.com!'), findsOneWidget);
    });

    testWidgets('Welcome screen displays correct username',
        (WidgetTester tester) async {
      // Build the WelcomeScreen widget
      await tester.pumpWidget(MaterialApp(
        home: WelcomeScreen(username: 'user@example.com'),
      ));

      // Verify the welcome message
      expect(find.text('Hello, user@example.com!'), findsOneWidget);
    });
  });
}
