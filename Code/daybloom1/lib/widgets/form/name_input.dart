import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;

  const NameInput({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(color: Colors.white70, fontSize: fontSizeXSmall),
        ),
        const SizedBox(height: spacingSmall),
        TextField(
          controller: nameController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Yuna Mizaki',
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