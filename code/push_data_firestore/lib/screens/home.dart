import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart';
import '../data/users.dart';
import '../data/entries.dart';
import '../styles/spacings.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _description = [];
  late final FirestoreODM odm;

  @override
  void initState() {
    super.initState();
    odm = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SizedBox(
          height: kBodyHeight,
          child: SingleChildScrollView(
            child: Column(
              children: _description.map((e) => Text(e)).toList(),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(kVerticalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: deleteCollections,
              label: const Row(
                children: [
                  Icon(Icons.delete_forever),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Delete data"),
                ],
              ),
            ),
            const SizedBox(height: kVerticalPaddingS),
            FloatingActionButton.extended(
              onPressed: () async {
                await authenticate();
                await addUsers();
                await addEntries();
              },
              label: const Row(
                children: [
                  Icon(Icons.published_with_changes),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Generate data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteCollections() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final users = await db.users.get();
    for (final user in users) {
      await db.users(user.id).delete();
      setState(() {
        _description.insert(0, "Deleted user ${user.id}");
      });
    }
  }

  Future<void> authenticate() async {
    for (final user in users) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: "123456789",
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _description.insert(0, "User ${user.email} already exists");
          });
        }
      }
    }
  }

  Future<void> addUsers() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    for (final user in users) {
      await db.users.insert(user);
      setState(() {
        _description.insert(0, "Added user ${user.email}");
      });
    }
  }

  Future<void> addEntries() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final dbUsers = await db.users.get();
    for (final user in dbUsers) {
      for (final entry in entries) {
        final entryWithUser = JournalEntry(
          id: entry.id,
          title: entry.title,
          content: entry.content,
          userId: user.id,
          createdAt: entry.createdAt,
        );
        await db.users(user.id).entries.insert(entryWithUser);
        setState(() {
          _description.insert(0, "Added entry: ${entry.title}");
        });
      }
    }
  }
}