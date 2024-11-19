//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hands_on_practicals/controllers.dart';
import 'package:hands_on_practicals/all_variables.dart';
import 'package:hands_on_practicals/product_screen.dart';

class Laptops extends StatelessWidget {
  
  const Laptops({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white30,
        appBar: AppBar(
          title: const Text('Laptops Hub',style:TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black12,
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if(value=='logout'){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return Homescreen();
                  }));
                }
                if(value=='products'){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                    return const ProductScreen();
                  }));
                }
              
                
              },
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem<String>(
                    value: 'Logout',
                    child: Text('Log Out')),
                    PopupMenuItem(
                      value: 'products',
                      child: Text('All Products'))
                ];

            })
          ],
          
        ),
        body: Column(
          children: [
            Expanded(
              child:size.width<650? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: laptops.length,
                itemBuilder: (context, index) {
                  final laptop = laptops[index];
                  return Contollers(
                    name: laptop['name'] as String,
                    image: laptop['image'] as String,
                    price: laptop['price'] as String,
                  );
                },
              ):GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                 childAspectRatio: 1.0),
                 
                itemCount: laptops.length,
                itemBuilder: (context,index){
                  final laptop=laptops[index];
                  
                   return Contollers(
                    name: laptop['name'] as String,
                    image: laptop['image'] as String,
                    price: laptop['price'] as String,
                  );

              })
            ),
          ],
        ),
      ),
    );
  }
}
