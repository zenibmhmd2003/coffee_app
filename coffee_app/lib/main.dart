import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme.dart';

void main() => runApp(const CoffeeApp());

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const LoginScreen(),
    );
  }
}
