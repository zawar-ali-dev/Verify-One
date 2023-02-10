import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialStateProperty, OutlineInputBorder, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),


        body: Stack(
          //the main body has a stack structure so each widget is technically placed upon each other, this allows for absolute positioning fo the widgets

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


            //the next 2 containers are all for texts that inform the user of their application being a failure, however theyre given the opportuinity to restart the process, they all have different fontsizes/weight and positioning
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 192, 0, 0),
              child: const Text ('Unfortunately, we could not verify some of your information',
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
              child: const Text ('Could we ask you to repeat the process once more, if the issue remains, then a manual verification will be conducted',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //elevated button to allow user to start the whole process once again
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
                onPressed: () { },
                child: const Text('Start Again',
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
