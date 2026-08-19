import 'package:daybloom/constants/size.dart';
import 'package:dto/models/journal_entry.dart';
import 'package:flutter/material.dart';
import '../edit_entry_screen.dart';

class EntryAppBar extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback onDelete;

  const EntryAppBar({
    super.key,
    required this.entry,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEntryScreen(entry: entry),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}