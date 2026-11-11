import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color tan = Color(0xFFC8975F); // الأزرار والكروت
  static const Color tanLight = Color(0xFFB88A55);
  static const Color brown = Color(0xFF6B4A2B); // خلفية Home / Cart / Checkout
  static const Color brownDark = Color(0xFF4A3220);
  static const Color dark = Color(0xFF0B0B0C); // خلفية Login / Register
  static const Color field = Color(0xFF17171A); // خلفية حقول الإدخال
  static const Color white = Colors.white;
}

class AppAssets {
  static const String beans = 'assets/images/coffee_beans_bg.png';
  static const String avatar = 'assets/images/avatar.png';
  static const String promoCup = 'assets/images/promo_cup.png';
  static const String arabica = 'assets/images/arabica.png';
  static const String robusta = 'assets/images/robusta.png';
  static const String excelsa = 'assets/images/excelsa.png';
  static const String liberica = 'assets/images/liberica.png';
  static const String cirtus = 'assets/images/cirtus.png';
}

ThemeData buildTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
    colorScheme: base.colorScheme.copyWith(primary: AppColors.tan),
  );
}
