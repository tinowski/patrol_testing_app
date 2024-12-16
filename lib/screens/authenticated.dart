import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class AuthenticatedScreen extends StatelessWidget {
  final Widget child;
  final String username;

  const AuthenticatedScreen(
      {Key? key, required this.child, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticated User'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(username: username),
      body: child,
    );
  }
}
