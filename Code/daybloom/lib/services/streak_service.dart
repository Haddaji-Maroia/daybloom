import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dto/dto.dart' as dto;

class StreakService {
  final db = dto.FirestoreODM(dto.appSchema, firestore: FirebaseFirestore.instance);

  Future<void> updateStreak({bool hasPhoto = false}) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    // Leggi il documento utente
    final userDoc = await db.users(uid).get();
    if (userDoc == null) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastEntry = userDoc.lastEntryDate;

    int newStreak = userDoc.currentStreak;

    if (lastEntry == null) {
      // Prima entry in assoluto
      newStreak = 1;
    } else {
      final lastDay = DateTime(lastEntry.year, lastEntry.month, lastEntry.day);
      final diff = today.difference(lastDay).inDays;

      if (diff == 0) {
        // Già scritto oggi — non cambia lo streak
      } else if (diff == 1) {
        // Ieri — incrementa streak
        newStreak = userDoc.currentStreak + 1;
      } else {
        // Più di un giorno — reset
        newStreak = 1;
      }
    }

    final newLongest = newStreak > userDoc.longestStreak
        ? newStreak
        : userDoc.longestStreak;

    // qui ho la logica del bagde
    final badges = List<String>.from(userDoc.unlockedBadges);

    if (!badges.contains('first_bloom')) {
      badges.add('first_bloom');
    }

    if (newStreak >= 7 && !badges.contains('week_streak')) {
      badges.add('week_streak');
    }

    if (hasPhoto && !badges.contains('photographer')) {
      badges.add('photographer');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
      'currentStreak': newStreak,
      'longestStreak': newLongest,
      'lastEntryDate': now,
      'unlockedBadges': badges,
    });
  }
}