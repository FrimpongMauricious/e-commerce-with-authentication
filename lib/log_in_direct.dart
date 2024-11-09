// login_screen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hands_on_practicals/product_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = "";

  // Method to log in with email and password
  Future<void> _logInWithEmailPassword() async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      // Navigate to the home page or logged-in screen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductScreen()), // Navigate to logged-in screen
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "An error occurred";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(80, 100, 190, 0.7),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white60, fontSize: 13),
                filled: true,
                fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white60, fontSize: 13),
                filled: true,
                fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: _logInWithEmailPassword,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(100, 100, 200, 1),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 80, right: 80),
                child: Text(
                  'Log in',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
