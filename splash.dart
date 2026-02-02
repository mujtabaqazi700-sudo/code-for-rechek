// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:kmodel1/registor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF3B82F6), // Blue
              Color(0xFF9333EA), // Purple
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check,
                  size: 64,
                  color: Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'CheckMate',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your Task Manager',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// login_screen.dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login functionality would go here!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              // child: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.all(12),
              //       decoration: BoxDecoration(
              //         color: const Color(0xFF3B82F6),
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //       child: const Icon(
              //         Icons.check,
              //         size: 32,
              //         color: Colors.white,
              //       ),
              //     ),
              //     const SizedBox(height: 24),
              //     const Text(
              //       'CheckMate',
              //       style: TextStyle(
              //         fontSize: 32,
              //         fontWeight: FontWeight.bold,
              //         color: Color(0xFF1F2937),
              //       ),
              //     ),
              //     const SizedBox(height: 8),
              //     const Text(
              //       'Login to your account',
              //       style: TextStyle(
              //         fontSize: 16,
              //         color: Color(0xFF6B7280),
              //       ),
              //     ),
              //     const SizedBox(height: 32),
              //     TextField(
              //       controller: _emailController,
              //       decoration: InputDecoration(
              //         labelText: 'Email',
              //         hintText: 'Enter your email',
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8),
              //           borderSide: const BorderSide(
              //             color: Color(0xFF3B82F6),
              //             width: 2,
              //           ),
              //         ),
              //       ),
              //       keyboardType: TextInputType.emailAddress,
              //     ),
              //     const SizedBox(height: 16),
              //     TextField(
              //       controller: _passwordController,
              //       decoration: InputDecoration(
              //         labelText: 'Password',
              //         hintText: 'Enter your password',
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8),
              //           borderSide: const BorderSide(
              //             color: Color(0xFF3B82F6),
              //             width: 2,
              //           ),
              //         ),
              //       ),
              //       obscureText: true,
              //     ),
              //     const SizedBox(height: 24),
              //     SizedBox(
              //       width: double.infinity,
              //       height: 48,
              //       child: ElevatedButton(
              //         onPressed: _handleLogin,
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color(0xFF3B82F6),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //         ),
              //         child: const Text(
              //           'Login',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(height: 24),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const Text(
              //           "Don't have an account? ",
              //           style: TextStyle(color: Color(0xFF6B7280)),
              //         ),
              //         GestureDetector(
              //           onTap: () {},
              //           child: const Text(
              //             'Sign up',
              //             style: TextStyle(
              //               color: Color(0xFF3B82F6),
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //         ),
              // ],
            ),
            //],
          ),
        ),
      ),
    );
    //);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
