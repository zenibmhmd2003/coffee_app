import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/common_widgets.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BeansBackground(
      hasOverlay: false, // بدون أي طبقة غامقة حتى تظهر الصورة نقية وواضحة
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(flex: 3),
            const Text(
              'Welcome to Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 28),
            const DarkField(
              hint: 'E-mail Address',
              keyboardType: TextInputType.emailAddress,
            ),
            const DarkField(
              hint: 'Password',
              obscure: true,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Sign in',
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
            ),
            const SizedBox(height: 36),
            const SocialButtons(),
            const Spacer(flex: 4),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterScreen()),
              ),
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account ? ",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: AppColors.tan,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}