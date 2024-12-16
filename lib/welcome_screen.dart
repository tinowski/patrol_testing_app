import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Text(
          'Hello $username',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
