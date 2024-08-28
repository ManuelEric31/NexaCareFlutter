import 'package:flutter/material.dart';
import 'package:nexacare/auth/auth_service.dart';
import 'package:nexacare/components/login_username_textfield.dart';
import 'package:nexacare/components/login_password_textfield.dart';
import 'package:nexacare/views/dashboard_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo Nexa Care
                Image.asset('assets/images/nexacarelogo.png', width: 250),

                const SizedBox(height: 16),

                // Welcome to NexaCare
                const Text(
                  'Kesehatan adalah aset berharga',
                  style: TextStyle(
                    color: Color(0xFF8696BB),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                  ),
                ),

                const SizedBox(height: 25),

                // Username TextField
                LoginUsernameTextField(
                  controllerTyped: usernameController,
                  obscureText: false,
                ),

                // Password TextField
                const SizedBox(height: 25),

                LoginPasswordTextField(
                  controllerTyped: passwordController,
                  obscureText: true,
                ),

                // Login Button
                const SizedBox(
                  height: 104,
                ),

                _isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF4894FE),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            _login();
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String? token = await AuthService().loginUser(
      context,
      usernameController.text,
      passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', token);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DashboardLoginPage(username: usernameController.text.toString())),
      );
    }
  }
}
