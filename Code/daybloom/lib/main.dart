import 'package:daybloom/routes.dart';
import 'package:daybloom/screens/home/home_screen.dart';
import 'package:daybloom/screens/welcome/welcome_screen.dart';
import 'package:daybloom/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'constants/colors.dart';

// Daybloom - Remise examen août 2026
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initNotification();
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
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      ),
      routes: routes,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen.routeName
          : HomeScreen.routeName,
    );
  }
}