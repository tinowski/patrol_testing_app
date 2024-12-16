import 'package:flutter/material.dart';

class ContractsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contracts')),
      body: Center(
        child: Text(
          'Contracts Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
