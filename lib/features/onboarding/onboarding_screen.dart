import 'package:flutter/material.dart';
import 'package:tabibna/core/utils/color_manger.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.water, // Muted orange
      body: const Center(
        child: Text(
          'Welcome to the Onboarding Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
