import 'package:capitalone_aml/step_1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class process extends StatelessWidget {
  final controller = PageController();
  var jsonData;

  process({this.jsonData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),

        body: PageView(
          //the whole body this time follows a pageview structure as the process should be illustarted via swipeable pages as its one coherent piece of information
          //here each page will be a child widget that is actually a stack widget itself therefore allowing for the layering of the various components
          children:  [
            Container(
              //this page explains the first part of the process, that is to capture an image of the user ID
              child: Stack(
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
            ),

            Container(
              //this page explains how to capture a picture of the face
              child: Stack(
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
            ),

            Container(
              //thjis last page contains information as to how the final part of the process should be executed, that is the entering of some personal information
              child: Stack(
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
            ),
          ],
        ),
      ),
    );
  }
}
