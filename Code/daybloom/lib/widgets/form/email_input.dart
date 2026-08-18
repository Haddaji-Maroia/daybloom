import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const EmailInput({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(color: Colors.white70, fontSize: fontSizeXSmall),
        ),
        const SizedBox(height: spacingSmall),
        TextField(
          controller: emailController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'yunamizaki@gmail.com',
            hintStyle: const TextStyle(color: Colors.white54, fontSize: fontSizeSmall),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: paddingMedium,
              vertical: paddingSmall,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusPill),
              borderSide: const BorderSide(color: inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusPill),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}