import 'package:daybloom/screens/entries/all_entries_screen.dart';
import 'package:daybloom/screens/entry/add_entry_screen.dart';
import 'package:daybloom/screens/home/home_screen.dart';
import 'package:daybloom/screens/login/login_screen.dart';
import 'package:daybloom/screens/onboarding/onboarding_one_screen.dart';
import 'package:daybloom/screens/onboarding/onboarding_three_screen.dart';
import 'package:daybloom/screens/onboarding/onboarding_two_screen.dart';
import 'package:daybloom/screens/profile/profile_screen.dart';
import 'package:daybloom/screens/register/register_screen.dart';
import 'package:daybloom/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> routes = {
  OnboardingOneScreen.routeName: (context) => const OnboardingOneScreen(),
  OnboardingTwoScreen.routeName: (context) => const OnboardingTwoScreen(),
  OnboardingThreeScreen.routeName: (context) => const OnboardingThreeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  AllEntriesScreen.routeName: (context) => const AllEntriesScreen(),
  AddEntryScreen.routeName: (context) => const AddEntryScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
};