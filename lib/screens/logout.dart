import 'package:flutter/material.dart';
import 'login.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Perform logout logic here (e.g., clearing user data, tokens, etc.)
    Future.delayed(Duration.zero, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
