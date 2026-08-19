import 'dart:io';
import 'package:dto/models/journal_entry.dart';
import 'package:flutter/material.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';
import '../../../utils/date_formatter.dart';

class EntryContent extends StatelessWidget {
  final JournalEntry entry;

  const EntryContent({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: spacingSmall),
            Text(
              formatEntryDate(entry.createdAt),
              style: const TextStyle(
                color: Colors.white70,
                fontSize: fontSizeSmall,
              ),
            ),
            const SizedBox(height: spacingLarge),
            if (entry.photoUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.file(
                  File(entry.photoUrl!),
                  width: double.infinity,
                  height: photoHeight,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: spacingLarge),
            Text(
              entry.content,
              style: const TextStyle(
                color: Colors.white,
                fontSize: fontSizeMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}