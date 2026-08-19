import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';
import 'streak_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    return StreamBuilder<AppUser?>(
      stream: db.users(user.uid).stream,
      builder: (context, snapshot) {
        final streak = snapshot.data?.currentStreak ?? 0;
        if (snapshot.hasError) return const SizedBox();
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
              StreakCard(streak: streak),
            ],
          ),
        );
      },
    );
  }
}