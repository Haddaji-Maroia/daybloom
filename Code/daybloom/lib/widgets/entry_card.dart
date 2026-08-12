import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/size.dart';

class EntryCard extends StatelessWidget {
  final String title;
  final String date;

  const EntryCard({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: spacingSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border(
          left: BorderSide(
            color: Color(0xFFB0C3FB),
            width: 5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: fontSizeMedium,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: spacingSmall),
            Text(
              date,
              style: const TextStyle(
                fontSize: fontSizeSmall,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}