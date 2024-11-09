import 'package:flutter/material.dart';

class LogedIn extends StatelessWidget {
  const LogedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('wow you were able to log in ', 
            style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
      ),
    );
  }
}