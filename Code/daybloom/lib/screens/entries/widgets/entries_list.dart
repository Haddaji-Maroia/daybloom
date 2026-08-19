import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../../../utils/date_formatter.dart';
import '../entry_card.dart';

class EntriesList extends StatelessWidget {
  final int? maxItems;

  const EntriesList({super.key, this.maxItems});

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const SizedBox();

    return StreamBuilder<List<JournalEntry>>(
      stream: db.users(user.uid).entries.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Something went wrong. Please try again.',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'No entries yet. Start writing!',
              style: TextStyle(color: Colors.white70),
            ),
          );
        }
        final entries = snapshot.data!;
        final count = maxItems != null && entries.length > maxItems!
            ? maxItems!
            : entries.length;
        return ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return EntryCard(
              title: entry.title,
              date: formatEntryDate(entry.createdAt),
              entryId: entry.id,
            );
          },
        );
      },
    );
  }
}