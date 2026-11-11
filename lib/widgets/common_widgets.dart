import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      height: 52,
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
      height: 54,
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

  Widget _btn(dynamic icon) => Expanded(
    child: Container(
      height: 54,
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: FaIcon(icon, color: Colors.white, size: 16),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _btn(FontAwesomeIcons.facebookF),
        const SizedBox(width: 28),
        _btn(FontAwesomeIcons.google),
        const SizedBox(width: 28),
        _btn(FontAwesomeIcons.twitter),
      ],
    );
  }
}

/// خلفية حبوب القهوة اللي تحت في Login / Register
class BeansBackground extends StatelessWidget {
  final Widget child;
  final bool hasOverlay;

  const BeansBackground({
    super.key,
    required this.child,
    this.hasOverlay = false, // بدون طبقة افتراضياً لـ Login
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.dark,
      body: SizedBox.expand(
        child: Stack(
          children: [
            // صورة الخلفية تغطي الشاشة كاملة
            Positioned.fill(
              child: Image.asset(
                AppAssets.beans,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.red.withOpacity(0.3),
                    alignment: Alignment.center,
                    child: Text(
                      'خطأ في تحميل مسار الصورة:\n${AppAssets.beans}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                },
              ),
            ),
            // طبقة التظليل: تُعرض فقط إذا كانت hasOverlay = true (شاشة Register)
            if (hasOverlay)
              Positioned.fill(
                child: Container(
                  color: AppColors.dark.withOpacity(0.55),
                ),
              ),
            // محتوى الصفحة
            Positioned.fill(
              child: SafeArea(
                child: child,
              ),
            ),
          ],
        ),
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