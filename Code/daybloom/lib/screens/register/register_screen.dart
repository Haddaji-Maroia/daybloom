import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../home/home_screen.dart';
import '../../widgets/form/name_input.dart';
import '../../widgets/form/email_input.dart';
import '../../widgets/form/password_input.dart';
import '../../widgets/form/auth_link.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingMedium),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: spacingXLarge),
                const Text(
                  'Hello !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: spacingXXLarge),
                NameInput(nameController: _nameController),
                const SizedBox(height: spacingLarge),
                EmailInput(emailController: _emailController),
                const SizedBox(height: spacingLarge),
                PasswordInput(passwordController: _passwordController),
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: spacingSmall),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ),
                const SizedBox(height: spacingLarge),
                SizedBox(
                  width: double.infinity,
                  height: buttonHeight,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final result = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        await result.user?.updateDisplayName(_nameController.text);
                        if (!context.mounted) return;
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          switch (e.code) {
                            case 'email-already-in-use':
                              _errorMessage = 'Email already in use.';
                              break;
                            case 'invalid-email':
                              _errorMessage = 'Invalid email.';
                              break;
                            case 'weak-password':
                              _errorMessage = 'Password too weak.';
                              break;
                            default:
                              _errorMessage = 'An error occurred.';
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusPill),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: fontSizeMedium,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: spacingXXLarge),
                AuthLink(
                  leftText: 'Already have an account ? ',
                  rightText: 'Login',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}