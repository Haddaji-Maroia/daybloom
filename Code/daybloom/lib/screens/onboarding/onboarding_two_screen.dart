import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import 'onboarding_three_screen.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});
  static const String routeName = "/onboarding_two";

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
                'assets/images/onboarding2.png',
                height: 250,
              ),
              const Spacer(),
              const Text(
                'Write Every Day',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: spacingSmall),
              const Text(
                'Turn your daily experiences into memories with simple and personal journal entries.',
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
                        builder: (context) => const OnboardingThreeScreen(),
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