import 'package:capitalone_aml/what_you_will_need.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, State, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: homeScreen(),
    );
  }
}

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 58, 111, 1),


        body: Stack(

          children:  [
            //container that holds the actual logo image as well as all the information to regulate its sizing and positioning
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(0, 147, 0, 0),
              child: Image.asset('assets/logo.png',
              width: 315,
              height: 110,
              )
            ),

            //page title
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 381, 0, 0),
              child: const Text ('Customer Verification',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //explanation  as to what the purpose of this application is
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 443, 0, 0),
              child: const Text ('In order to progress with your application,\n we need you to verify a few things.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

           //elevated button to prompt the user to begin
           Container(
             alignment: Alignment.topCenter,
             padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
             child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
               onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>whatYouNeed()
                  ));
               },
                 child: const Text('Get Started',
                 style: TextStyle(
                  color: Color.fromRGBO(0, 58, 111, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                 ),
               ),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
