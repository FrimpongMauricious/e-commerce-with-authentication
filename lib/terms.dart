import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left:40,right: 40),
            child: Text('Any false information provided in attempt to win this\n scholarship would be faced with the FERPO penalty.\n Users are entreated to provide the institution with the correct details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),))
        ],
      ),
    );
  }
}