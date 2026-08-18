import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../login/login_screen.dart';
import '../onboarding/onboarding_one_screen.dart';
import '../../widgets/form/auth_link.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = "/welcome";

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
                'assets/images/onboarding1.png',
                height: 250,
              ),
              const Spacer(),
              const Text(
                'Daybloom',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: spacingSmall),
              const Text(
                'Your personal journal',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: fontSizeMedium,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OnboardingOneScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusPill),
                    ),
                  ),
                  child: const Text(
                    "Let's get started",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: fontSizeMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: spacingLarge),
              const Divider(color: Colors.white24),
              const SizedBox(height: spacingLarge),
              AuthLink(
                leftText: 'Already have an account ? ',
                rightText: 'Login',
                onTap: () => Navigator.pushNamed(context, LoginScreen.routeName),
              ),
              const SizedBox(height: spacingLarge),
            ],
          ),
        ),
      ),
    );
  }
}