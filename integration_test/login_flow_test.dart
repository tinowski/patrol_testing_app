import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('User can sign in and see welcome screen', ($) async {
    // Launch the app
    await $.pumpApp();

    // Verify the login screen is displayed
    expect($(#usernameField).exists, true);
    expect($(#passwordField).exists, true);
    expect($(#signInButton).exists, true);

    // Enter username and password
    await $(#usernameField).enterText('TestUser');
    await $(#passwordField).enterText('password123');

    // Tap the Sign In button
    await $(#signInButton).tap();

    // Verify the welcome screen is displayed
    expect($(#welcomeMessage).exists, true);
    expect($(#welcomeMessage).text, 'Hello TestUser');
  });
}
