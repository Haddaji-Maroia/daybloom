import 'package:dto/dto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class ProfileBadges extends StatelessWidget {
  const ProfileBadges({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    return StreamBuilder<AppUser?>(
      stream: db.users(user.uid).stream,
      builder: (context, snapshot) {
        final badges = snapshot.data?.unlockedBadges ?? [];
        if (badges.isEmpty) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Badges',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: spacingSmall),
            Wrap(
              spacing: spacingSmall,
              runSpacing: spacingSmall,
              children: badges.map((badge) {
                String label = badge;
                if (badge == 'first_bloom') label = 'First Bloom';
                if (badge == 'week_streak') label = 'Week Streak';
                if (badge == 'photographer') label = 'Photographer';
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: paddingSmall,
                    vertical: paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(color: buttonColor),
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeSmall,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}