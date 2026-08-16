import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';
import 'streak_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: const EdgeInsets.all(paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome ${user.displayName ?? 'back'}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Today',
            style: TextStyle(
              color: Colors.white70,
              fontSize: fontSizeSmall,
            ),
          ),
          const SizedBox(height: spacingLarge),
          const StreakCard(streak: 5),
        ],
      ),
    );
  }
}