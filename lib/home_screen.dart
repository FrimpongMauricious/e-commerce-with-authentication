import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hands_on_practicals/loged_in.dart';
import 'package:hands_on_practicals/phones_list.dart';
import 'package:hands_on_practicals/product_screen.dart';
import 'package:hands_on_practicals/login_screen.dart';
import 'package:hands_on_practicals/log_in_direct.dart';  // Import your LogedIn screen

// Google Sign-In Button Widget
class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.account_circle, color: Colors.blue),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        //primary: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// HomeScreen Widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  // Controllers for text fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Error handling
  String _errorMessage = "";

  // Method for Email and Password Sign Up
  Future<void> _signUpWithEmailPassword() async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      // Navigate to the LogedIn screen after successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductScreen()), // Navigate to LogedIn screen
      );
      
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "An error occurred";
      });
    }
  }

  // Method for Google Sign-In (Web)
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed in with Google: ${userCredential.user?.email}')),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? "An error occurred";
      });
    }
  }

  // Method to handle login navigation
  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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
              'Create an account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                GestureDetector(
                  onTap: _navigateToLogin,  // Navigate to login screen
                  child: const Text(
                    'Log in',
                    style: TextStyle(color: Colors.purple, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'First name',
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
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: Colors.white54, fontSize: 15),
                      filled: true,
                      fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70, width: 2.2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
              onPressed: _signUpWithEmailPassword,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(100, 100, 200, 1),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 80, right: 80),
                child: Text(
                  'Create an account',
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
            const Text(
              '____________________________  Or register with  ___________________________',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 20),
            GoogleSignInButton(onPressed: _signInWithGoogle),
          ],
        ),
      ),
    );
  }
}

