//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hands_on_practicals/controllers.dart';
import 'package:hands_on_practicals/all_variables.dart';
import 'package:hands_on_practicals/home_screen.dart';
import 'package:hands_on_practicals/product_screen.dart';

class Iron extends StatelessWidget {
  
  const Iron({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: const Text('Pressing Iron Hub',style:TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.black12,
          actions:<Widget> [
               // Add PopupMenuButton to AppBar actions
            PopupMenuButton<String>(
            
              onSelected: (value) {
                // Handle menu item selection
                if (value == 'Logout') {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return const HomeScreen();
                  }));
                  //throw('Item 1 selected');
                } else if (value == 'products') {
                  // Action for item 2
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return const ProductScreen();
                  }));
                } else if (value == 'item3') {
                  // Action for item 3
                  throw('Item 3 selected');
                }
              },
               itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Logout',
                    child: Text('Log out'),
                  ),
                  PopupMenuItem<String>(
                    value: 'products',
                    child: Text('All products'),
                  ),
                  PopupMenuItem<String>(
                    value: 'item3',
                    child: Text('Item 3'),
                  ),
                ];
              },
            )
          ]
          
        ),
        body: Column(
          children: [
            Expanded(
              child:size.width<650? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  final iron = irons[index];
                  return Contollers(
                    name: iron['name'] as String,
                    image: iron['image'] as String,
                    price: iron['price'] as String,
                  );
                },
              ):GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                 childAspectRatio: 1.1),
                 
                itemCount: controllers.length,
                itemBuilder: (context,index){
                  final iron=irons[index];
                  
                   return Contollers(
                    name: iron['name'] as String,
                    image: iron['image'] as String,
                    price: iron['price'] as String,
                  );

              })
            ),
          ],
        ),
      ),
    );
  }
}
//import 'dart:js';
