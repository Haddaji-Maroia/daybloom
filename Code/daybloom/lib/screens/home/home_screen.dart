import 'package:daybloom/screens/home/widgets/recent_entries.dart';
import 'package:daybloom/screens/home/widgets/streak_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  const StreakCard(streak: 5),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: primaryColor,
                padding: const EdgeInsets.all(paddingMedium),
                child: const RecentEntries(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}