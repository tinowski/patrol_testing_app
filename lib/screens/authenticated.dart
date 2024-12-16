import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class AuthenticatedScreen extends StatelessWidget {
  final Widget child;

  const AuthenticatedScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authenticated Area'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
