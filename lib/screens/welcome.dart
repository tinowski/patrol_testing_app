import 'package:flutter/material.dart';
import 'authenticated.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticatedScreen(
      child: Center(
        child: Text(
          'Welcome, $username!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
