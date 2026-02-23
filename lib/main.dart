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
      home: const homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V2rayZ'),
      ),
      body: const Center(
        child: Text('Welcome to V2rayZ!'),
      ),
    );
  }
}
