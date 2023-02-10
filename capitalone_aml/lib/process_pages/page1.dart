import 'package:capitalone_aml/step_1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, CircleAvatar, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, IconButton, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class page1 extends StatelessWidget{
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 58, 111, 1),
      body: Stack(
        children:  [
          //container that holds the actual logo image as well as all the information to regulate its sizing and positioning
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Image.asset('assets/logo.png',
                width: 158,
                height: 55,
              )
          ),

          //an illustratin explaining how an image of the id should be captured
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Image.asset('assets/capture_id.jpg',
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
            padding: const EdgeInsets.fromLTRB(20, 526, 0, 0),
            child: const Text ('Take an image of your Driving Licence.',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(20, 619, 20, 0),
            child: const Text ('First, by taking a clear picture of your ID, we can verify you are you!',
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