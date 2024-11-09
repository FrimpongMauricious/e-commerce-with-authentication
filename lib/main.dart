import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hands_on_practicals/home_screen.dart';

// Initialize Firebase options
final FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyDh-IPs6PvIFywqj86_B_gyjHUYsg-chX0",
  authDomain: "sign-in-eff96.firebaseapp.com",
  projectId: "sign-in-eff96",
  storageBucket: "sign-in-eff96.appspot.com",
  messagingSenderId: "217661376641",
  appId: "1:217661376641:web:fea17d5c7bbc7857076580",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);  // Pass the options directly
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
