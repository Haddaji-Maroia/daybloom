import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import 'onboarding_two_screen.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});
  static const String routeName = "/onboarding_one";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingMedium),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/onboarding11.png',
                height: 250,
              ),
              const Spacer(),
              const Text(
                'Welcome to Your Journal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: spacingSmall),
              const Text(
                'Capture your thoughts, feelings, and everyday moments in one place.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: fontSizeMedium,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingTwoScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.all(paddingSmall),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusPill),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: fontSizeMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}