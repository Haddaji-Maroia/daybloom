import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class StreakCard extends StatelessWidget {
  final int streak;

  const StreakCard({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingMedium,
        vertical: paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$streak days straight',
            style: const TextStyle(
              color: Colors.white,
              fontSize: fontSizeMedium,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: spacingSmall),
          const Icon(
            Icons.local_fire_department,
            color: buttonColor,
          ),
        ],
      ),
    );
  }
}