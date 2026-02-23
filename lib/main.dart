import 'package:flutter/material.dart';

void main() {
  runApp(const V2rayZ());
}

class V2rayZ extends StatelessWidget {
  const V2rayZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V2rayZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Hello, V2rayZ!'),
        ),
      ),
    );
  }
}

