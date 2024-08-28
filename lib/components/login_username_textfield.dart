import 'package:flutter/material.dart';

class LoginUsernameTextField extends StatelessWidget {
  final TextEditingController controllerTyped;
  final bool obscureText;

  const LoginUsernameTextField(
      {super.key, required this.controllerTyped, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
      child: TextField(
        controller: controllerTyped,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: const Color(0xFFFAFAFA),
          filled: true,
          hintText: 'Username',
          hintStyle:
              const TextStyle(fontFamily: 'Poppins', color: Color(0xFF8696BB)),
          prefixIcon: const Icon(Icons.person, color: Color(0xFF8696BB)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
