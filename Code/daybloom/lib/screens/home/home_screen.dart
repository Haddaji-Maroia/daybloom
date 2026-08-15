import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../../widgets/entry_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'Welcome Yuna',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeLarge,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Tuesday 5 July',
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
                        Container(
                          padding: const EdgeInsets.all(spacingSmall),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: buttonColor),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: spacingSmall),
                    const EntryCard(title: 'Football game !', date: '20:35 • July 2, 2026'),
                    const EntryCard(title: 'Morning July', date: '11:00 • July 1, 2026'),
                    const EntryCard(title: 'A weird day...', date: '18:35 • Jun 27, 2026'),
                    const EntryCard(title: 'Date with Mum', date: '17:24 • June 20, 2026'),
                    const EntryCard(title: 'First day of summer', date: '09:00 • June 15, 2026'),
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
          setState(() {
            _selectedIndex = index;
          });
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