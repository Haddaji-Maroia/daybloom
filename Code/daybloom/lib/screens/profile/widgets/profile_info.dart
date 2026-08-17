import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.displayName ?? 'User',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.email ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: fontSizeSmall,
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage('assets/icons/clover.jpeg'),
            ),
          ],
        ),
        const SizedBox(height: spacingLarge),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: const Text(
                  '5 Streak',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: spacingSmall),
            Expanded(
              child: StreamBuilder<List<JournalEntry>>(
                stream: db.users(user.uid).entries.stream,
                builder: (context, snapshot) {
                  final count = snapshot.data?.length ?? 0;
                  return Container(
                    padding: const EdgeInsets.all(paddingMedium),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Text(
                      '$count Entry',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}