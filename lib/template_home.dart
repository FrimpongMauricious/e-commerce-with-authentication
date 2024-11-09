import 'package:flutter/material.dart';
import 'package:hands_on_practicals/loged_in.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(80, 100, 190, 0.7),
      body:Padding(
        padding: EdgeInsets.only(left:40, right: 40),
        child: Column(
          children: [
            Text('Create an account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 20,),
            Row(children: [
              Text('Already have an account? ',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12
              ),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Text('Log in',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 12
                ),
                ),
              ),
            ],
            ),
            SizedBox(height: 40,),
            Row(children: [
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    hintText: 'Firts name',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 13
                      
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2.2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2
                      )
                    )
                  ),
                  
                  
                ),
                ),
                SizedBox(width: 30,),

              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    hintText: 'Last name',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                      
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2.2
                      )
                    )
                  ),
                )
                )
            ],
            ),
            SizedBox(height: 20,),
             TextField(
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 13
                      
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2.2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2
                      )
                    )
                  ),
                  
                  
                ),


                SizedBox(height: 20,),


                 TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white70
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 13
                      
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(100, 100, 150, 0.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2.2
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                        width: 2
                      )
                    )
                  ),
                  
                  
                ),
                SizedBox(height: 30,),


                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return LogedIn();
                  }));
                }, 

                
                style: TextButton.styleFrom(

                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromRGBO(100, 100, 200, 1)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 80,right: 80),
                  child: Text('Create an account',
                  style: TextStyle(
                    fontSize: 14
                  ),
                  ),
                ),
                ),
                SizedBox(height: 20,),
                Text('____________________________  Or register with  ___________________________',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12
                ),
                ),
                SizedBox(height: 25,),


               Row(children: [
                 

                Padding(
                  padding: EdgeInsets.only(left: 140,right: 60),
                  child: GestureDetector(
                    onTap: () {
                      
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                      backgroundImage: AssetImage('assets/images/google.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 100),
                  child: CircleAvatar(
                    backgroundColor: Colors.white38,
                    backgroundImage: AssetImage('assets/images/apple.png'),
                  ),
                ),
               ],)
          ],
        ),
      ),
    );
  }
}