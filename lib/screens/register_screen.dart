import 'package:flutter/material.dart';
import '../widgets/common_widgets.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BeansBackground(
      hasOverlay: true, // تفعيل الطبقة الغامقة لشاشة الريجستر
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            const Text(
              'Register your Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 28),
            const DarkField(hint: 'Full Name'),
            const DarkField(
              hint: 'E-mail Address',
              keyboardType: TextInputType.emailAddress,
            ),
            const DarkField(hint: 'Password', obscure: true),
            const DarkField(hint: 'Confirm Password', obscure: true),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Register',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
              ),
            ),
            const SizedBox(height: 48),
            const SocialButtons(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}