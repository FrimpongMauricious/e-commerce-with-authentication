import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 30),
        child: Column(
          children: [
            Text('you have been sent an email to verify your account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
             SizedBox(height:20 ),
            Row(
              children: [
                Text("Didn't receive email? ",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                ),
                ),
                GestureDetector(
                  onTap: () async{
                    final user=FirebaseAuth.instance.currentUser;
                    user?.sendEmailVerification();
                  },
                  child: Text('Resend mail',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            )
        
          ],
        ),
      ),
    );
  }
}