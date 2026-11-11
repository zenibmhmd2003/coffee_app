import 'package:flutter/material.dart';
import '../theme.dart';

/// حقل إدخال غامق زي Login / Register
class DarkField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const DarkField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontSize: 12),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 11),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        ),
      ),
    );
  }
}

/// الزرار الرئيسي (Sign in / Register / Continue Payment)
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.tan,
    this.textColor = AppColors.dark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

/// أزرار فيسبوك / جوجل / تويتر
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  Widget _btn(IconData icon) => Expanded(
        child: Container(
          height: 46,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: AppColors.field,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _btn(Icons.facebook),
        _btn(Icons.g_mobiledata),
        _btn(Icons.alternate_email), // استبدلها بأيقونة تويتر لو عندك
      ],
    );
  }
}

/// خلفية حبوب القهوة اللي تحت في Login / Register
class BeansBackground extends StatelessWidget {
  final Widget child;
  const BeansBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 260,
            child: Image.asset(AppAssets.beans, fit: BoxFit.cover),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

/// الـ Bottom Navigation المخصص (home / cart / heart / profile)
class CoffeeBottomNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const CoffeeBottomNav({super.key, required this.index, required this.onTap});

  static const _icons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: AppColors.tan,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (i) {
          final selected = i == index;
          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: selected ? AppColors.brownDark : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[i],
                color: selected ? Colors.white : AppColors.dark,
                size: 22,
              ),
            ),
          );
        }),
      ),
    );
  }
}
