import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();

    return Row(
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
    );
  }
}