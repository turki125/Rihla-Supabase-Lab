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
        scaffoldBackgroundColor: const Color(0xFFE8DDD0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3D2A20),
          primary: const Color(0xFF3D2A20),
          secondary: const Color(0xFF6E8062),
          surface: const Color(0xFFFFF9F3),
          onSurface: const Color(0xFF29201A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE8DDD0),
          foregroundColor: Color(0xFF29201A),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color(0xFFDCE5D8),
          indicatorColor: Color(0xFFB8CBB2),
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF3D2A20),
            foregroundColor: const Color(0xFFFFF9F3),
            minimumSize: const Size.fromHeight(52),
            shape: const StadiumBorder(),
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xFF29201A),
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
          ),
          titleLarge: TextStyle(
            color: Color(0xFF29201A),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
