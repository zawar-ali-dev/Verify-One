import 'package:capitalone_aml/step_1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, CircleAvatar, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, IconButton, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class page3 extends StatelessWidget{
  var jsonData;

  page3(this.jsonData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 58, 111, 1),

      body: Stack(
        children:  [
          Container(
            //the capital one logo and its positioning on the screen
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Image.asset('assets/logo.png',
                width: 158,
                height: 55,
              )
          ),

          //illustraion of how the information should be entered
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Image.asset('assets/enter_info.jpg',
              height: 350,
              width: 350,),
          ),

          //the following three containers house various texts that explain this particular stage of the process in more details
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
            child: const Text ('Enter some of your details.',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(20, 619, 15, 0),
            child: const Text ('Lastly, using these details, we can compare them to what is on your ID.',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),

          //this final screen will also have an elevated button at the bottom allowing the user to proceed to the actual process
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
                    MaterialPageRoute(builder: (context)=>step1screen(jsonData: jsonData,)
                    ));
              },
              child: const Text('Ready to start?',
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

    );
  }
}