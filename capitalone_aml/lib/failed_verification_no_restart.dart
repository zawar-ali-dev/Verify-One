import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialStateProperty, OutlineInputBorder, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';




class failedNoRestart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),


        body: Stack(          //the main body has a stack structure so each widget is technically placed upon each other, this allows for absolute positioning fo the widgets


          //container that holds the actual logo image as well as all the information to regulate its sizing and positioning
          children:  [
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset('assets/logo.png',
                  width: 158,
                  height: 55,
                )
            ),

            //the next five containers are all for texts that inform the user of their application being a failure, they all have different fontsizes/weight and positioning
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 192, 0, 0),
              child: const Text ('Unfortunately, we could not automatically verify some of your information',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),


            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(20, 400, 20, 0),
              child: const Text ('The information you have provided has now been sent to our colleagues for manual verification ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),


            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(20, 480, 20, 0),
              child: const Text ('Please await an email from our team.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(20, 530, 20, 0),
              child: const Text ('We apologize for the inconvenience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),


            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: const Text ('Feel free to delete this app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
