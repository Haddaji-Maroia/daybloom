import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';
import '../../widgets/form/email_input.dart';
import '../../widgets/form/password_input.dart';
import '../../widgets/form/auth_link.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeLarge,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: spacingXXLarge),
                EmailInput(emailController: _emailController),
                const SizedBox(height: spacingLarge),
                PasswordInput(passwordController: _passwordController),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot password ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeXSmall,
                      ),
                    ),
                  ),
                ),
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
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (!context.mounted) return;
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } on FirebaseAuthException catch (e) {
                        setState(() {
                          switch (e.code) {
                            case 'wrong-password':
                              _errorMessage = 'Wrong password.';
                              break;
                            case 'invalid-email':
                              _errorMessage = 'Invalid email.';
                              break;
                            case 'user-not-found':
                              _errorMessage = 'User not found.';
                              break;
                            case 'invalid-credential':
                              _errorMessage = 'Invalid credentials.';
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
                      'Login',
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
                  leftText: "Don't have an account ? ",
                  rightText: 'Sign up',
                  onTap: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}