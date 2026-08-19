import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart' as dto;
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();
    final db = dto.FirestoreODM(dto.appSchema, firestore: FirebaseFirestore.instance);

    return Row(
      children: [
        Expanded(
          child: StreamBuilder<dto.User?>(
            stream: db.users(user.uid).stream,
            builder: (context, snapshot) {
              final streak = snapshot.data?.currentStreak ?? 0;
              return Container(
                padding: const EdgeInsets.all(paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Text(
                  '$streak Streak',
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
        const SizedBox(width: spacingSmall),
        Expanded(
          child: StreamBuilder<List<dto.JournalEntry>>(
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
    );
  }
}