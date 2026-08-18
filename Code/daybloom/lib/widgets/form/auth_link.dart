import 'package:flutter/material.dart';
import '../../constants/fonts.dart';

class AuthLink extends StatelessWidget {
  final String leftText;
  final String rightText;
  final VoidCallback onTap;

  const AuthLink({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(leftText, style: const TextStyle(color: Colors.white70, fontSize: fontSizeXSmall)),
        GestureDetector(
          onTap: onTap,
          child: Text(rightText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: fontSizeXSmall)),
        ),
      ],
    );
  }
}