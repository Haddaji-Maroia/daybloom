import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class EntryFormHeader extends StatelessWidget {
  final bool isSaving;
  final bool isEditing;
  final VoidCallback onSave;

  const EntryFormHeader({
    super.key,
    required this.isSaving,
    required this.isEditing,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          onPressed: isSaving ? null : onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusPill),
            ),
          ),
          child: Text(
            isEditing ? 'Update' : 'Save',
            style: const TextStyle(color: primaryColor),
          ),
        ),
      ],
    );
  }
}