import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';

import '../../utils/date_formatter.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'entry_card.dart';

class AllEntriesScreen extends StatelessWidget {
  const AllEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All entries',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: spacingLarge),
              Expanded(
                child: StreamBuilder<List<JournalEntry>>(
                  stream: db.users(user.uid).entries.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
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
                    return ListView.builder(
                      itemCount: entries.length,
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
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}