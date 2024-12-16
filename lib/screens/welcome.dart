import 'package:flutter/material.dart';
import 'authenticated.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticatedScreen(
      username: username, // Pass the username to AuthenticatedScreen
      child: Center(
        child: Text(
          'Welcome, $username!',
          key: Key('welcomeMessage'),
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
