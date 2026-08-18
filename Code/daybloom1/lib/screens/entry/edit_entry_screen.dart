import 'dart:io';
import 'package:dto/models/journal_entry.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dto/dto.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import 'widgets/entry_form_header.dart';

class EditEntryScreen extends StatefulWidget {
  final JournalEntry entry;

  const EditEntryScreen({super.key, required this.entry});

  @override
  State<EditEntryScreen> createState() => _EditEntryScreenState();
}

class _EditEntryScreenState extends State<EditEntryScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  bool _isSaving = false;
  XFile? _pickedImage;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry.title);
    _contentController = TextEditingController(text: widget.entry.content);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _pickedImage = image);
    }
  }

  Future<void> _updateEntry() async {
    setState(() => _isSaving = true);
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
    final user = FirebaseAuth.instance.currentUser!;

    await db.users(user.uid).entries(widget.entry.id).update(
      JournalEntry(
        id: widget.entry.id,
        title: _titleController.text,
        content: _contentController.text,
        userId: user.uid,
        createdAt: widget.entry.createdAt,
        photoUrl: _pickedImage?.path ?? widget.entry.photoUrl,
      ),
    );

    setState(() => _isSaving = false);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EntryFormHeader(
                isSaving: _isSaving,
                isEditing: true,
                onSave: _updateEntry,
              ),
              const SizedBox(height: spacingLarge),
              TextField(
                controller: _titleController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Title...',
                  hintStyle: TextStyle(color: Colors.white38),
                  border: InputBorder.none,
                ),
              ),
              const Divider(color: Colors.white24),
              const SizedBox(height: spacingSmall),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: photoHeight,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: _pickedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: Image.file(
                      File(_pickedImage!.path),
                      fit: BoxFit.cover,
                    ),
                  )
                      : const Icon(
                    Icons.camera_alt,
                    color: Colors.white38,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: spacingSmall),
              Expanded(
                child: TextField(
                  controller: _contentController,
                  maxLines: null,
                  expands: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Write your thoughts...',
                    hintStyle: TextStyle(color: Colors.white38),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}