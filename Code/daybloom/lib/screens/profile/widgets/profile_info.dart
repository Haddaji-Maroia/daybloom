import 'package:daybloom/screens/profile/widgets/profile_avatar.dart';
import 'package:daybloom/screens/profile/widgets/profile_badges.dart';
import 'package:daybloom/screens/profile/widgets/profile_stats.dart';
import 'package:flutter/material.dart';
import '../../../constants/size.dart';


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileAvatar(),
        const SizedBox(height: spacingLarge),
        const ProfileStats(),
        const SizedBox(height: spacingLarge),
        const ProfileBadges(),
      ],
    );
  }
}