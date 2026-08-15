import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:dto/dto.dart';
import '../entry/add_entry_screen.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../entry/entry_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: primaryColor,
              padding: const EdgeInsets.all(paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome ${user.displayName ?? 'back'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Today',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: fontSizeSmall,
                    ),
                  ),
                  const SizedBox(height: spacingLarge),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingMedium,
                      vertical: paddingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          '5 days straight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: spacingSmall),
                        Icon(
                          Icons.local_fire_department,
                          color: buttonColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: primaryColor,
                padding: const EdgeInsets.all(paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'RECENT ENTRIES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeSmall,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddEntryScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(spacingSmall),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: buttonColor),
                            ),
                            child: const Icon(Icons.add, color: buttonColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: spacingSmall),
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
                            itemCount: entries.length > 5 ? 5 : entries.length,
                            itemBuilder: (context, index) {
                              final entry = entries[index];
                              return EntryCard(
                                title: entry.title,
                                date: '${entry.createdAt.day}/${entry.createdAt.month}/${entry.createdAt.year} • ${entry.createdAt.hour}:${entry.createdAt.minute.toString().padLeft(2, '0')}',
                                entry: entry,
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEntryScreen(),
              ),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.eco_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}