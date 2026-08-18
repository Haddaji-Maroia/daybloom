import 'package:daybloom/screens/entry/widgets/entry_app_bar.dart';
import 'package:daybloom/screens/entry/widgets/entry_content.dart';
import 'package:dto/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../../constants/colors.dart';

class EntryDetailScreen extends StatefulWidget {
  final String entryId;

  const EntryDetailScreen({super.key, required this.entryId});

  @override
  State<EntryDetailScreen> createState() => _EntryDetailScreenState();
}

class _EntryDetailScreenState extends State<EntryDetailScreen> {
  void _handleDelete() {
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: StreamBuilder<JournalEntry?>(
          stream: db.users(user.uid).entries(widget.entryId).stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            final entry = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EntryAppBar(
                  entry: entry,
                  onDelete: () async {
                    await db.users(user.uid).entries(widget.entryId).delete();
                    _handleDelete();
                  },
                ),
                EntryContent(entry: entry),
              ],
            );
          },
        ),
      ),
    );
  }
}