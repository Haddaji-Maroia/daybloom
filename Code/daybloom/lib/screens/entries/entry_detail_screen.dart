import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../../utils/date_formatter.dart';
import 'add_entry_screen.dart';

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
                Padding(
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
                                  builder: (context) => AddEntryScreen(entry: entry),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () async {
                              await db.users(user.uid).entries(widget.entryId).delete();
                              _handleDelete();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (entry.photoUrl != null)
                  Container(
                    width: double.infinity,
                    height: photoHeight,
                    margin: const EdgeInsets.symmetric(horizontal: paddingMedium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                        image: NetworkImage(entry.photoUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Expanded(
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}