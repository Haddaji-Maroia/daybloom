import 'package:flutter/material.dart';
import 'widgets/entry_card.dart';
import 'constants/colors.dart';
import 'constants/fonts.dart';
import 'constants/size.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daybloom',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // PARTE SCURA
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
                          color: Color(0xFFB0C3FB),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // PARTE BIANCA
            Expanded(
              child: Container(
                // qui cambi lo sfondo dove ci sono le entry
                //color: Colors.grey.shade100,
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
                            border: Border.all(
                              color: Color(0xFFB0C3FB),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xFFB0C3FB),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: spacingSmall),
                    const EntryCard(
                      title: 'Football game !',
                      date: '20:35 • July 2, 2026',
                    ),
                    const EntryCard(
                      title: 'Morning July',
                      date: '11:00 • July 1, 2026',
                    ),
                    const EntryCard(
                      title: 'A weird day...',
                      date: '18:35 • Jun 27, 2026',
                    ),
                    const EntryCard(
                      title: 'Date with Mum',
                      date: '17:24 • June 20, 2026',
                    ),
                    const EntryCard(
                      title: 'First day of summer',
                      date: '09:00 • June 15, 2026',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
