import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(const RihlaApp());
}

class RihlaApp extends StatelessWidget {
  const RihlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rihla',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F0E7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF183B36),
          primary: const Color(0xFF183B36),
          secondary: const Color(0xFFC97832),
          surface: const Color(0xFFFFFCF7),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
