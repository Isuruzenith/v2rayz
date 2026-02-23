import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const V2rayZ());
}

class V2rayZ extends StatelessWidget {
  const V2rayZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V2rayZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF6C63FF),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0D0D1A),
        cardTheme: const CardThemeData(
          color: Color(0xFF1A1A2E),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
    );
  }
}
