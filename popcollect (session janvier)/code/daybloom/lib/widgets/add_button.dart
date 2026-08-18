import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/size.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(spacingSmall),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: buttonColor),
        ),
        child: const Icon(Icons.add, color: buttonColor),
      ),
    );
  }
}