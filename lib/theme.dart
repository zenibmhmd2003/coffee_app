import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color tan = Color(0xFFCE9760); // #CE9760 الأزرار والكروت
  static const Color tanLight = Color(0xFF90683F); // بنر الخصم (مقاس من التصميم)
  static const Color pill = Color(0xFF674B30); // زرار "Change" في Checkout
  static const Color brown = Color(0xFF543A20); // #543A20 خلفية Home / Cart / Checkout
  static const Color brownDark = Color(0xFF543A20); // أزرار + و − وزرار Apply (نفس البني)
  static const Color dark = Color(0xFF08080A); // خلفية Login / Register (مقاس من التصميم)
  // Figma: #16181CB2 → الـ alpha في فيجما آخر الكود (B2)، وفي فلاتر أوله: 0xB216181C
  static const Color field = Color(0xB216181C); // حقول الإدخال
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