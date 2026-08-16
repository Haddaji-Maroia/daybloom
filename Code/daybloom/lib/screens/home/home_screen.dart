import 'package:daybloom/screens/home/widgets/home_header.dart';
import 'package:daybloom/screens/home/widgets/recent_entries.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../constants/colors.dart';
import '../../constants/size.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
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