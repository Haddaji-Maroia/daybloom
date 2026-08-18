import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../../constants/size.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordInput({super.key, required this.passwordController});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(color: Colors.white70, fontSize: fontSizeXSmall),
        ),
        const SizedBox(height: spacingSmall),
        TextField(
          controller: widget.passwordController,
          obscureText: !_passwordVisible,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter your password',
            hintStyle: const TextStyle(color: Colors.white54, fontSize: fontSizeSmall),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: paddingMedium,
              vertical: paddingSmall,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusPill),
              borderSide: const BorderSide(color: inputBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusPill),
              borderSide: const BorderSide(color: Colors.white),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white70,
              ),
              onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
            ),
          ),
        ),
      ],
    );
  }
}
