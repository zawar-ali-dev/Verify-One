import 'package:capitalone_aml/step_1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, CircleAvatar, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, IconButton, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class page2 extends StatelessWidget{
  const page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 58, 111, 1),
      body: Stack(
        children:  [
          //the capital one logo and its positioning on the screen
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Image.asset('assets/logo.png',
                width: 158,
                height: 55,
              )
          ),

          //illustration of how one should capture an image of their face
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Image.asset('assets/capture_face.jpg',
              height: 350,
              width: 350,),
          ),

          //the following three containers house various texts that explain this particualr stage of the process in more details
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 90, 130, 0),
            child: const Text ('The Process',
              style: TextStyle(
                fontSize: 36,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 526, 45, 0),
            child: const Text ('A clear picture of your face.',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(20, 619, 15, 0),
            child: const Text ('Then, using both photos; from your ID and this selfie, we can compare them and verify they match.',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}