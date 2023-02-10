import 'dart:convert';

import 'package:capitalone_aml/glare.dart';
import 'package:capitalone_aml/the_process.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, Theme, ThemeData, Widget, runApp, showDialog;
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

class whatYouNeed extends StatelessWidget {

  final url = 'https://aml.unioutlet.co.uk/init';
  var jsonData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),

        //the main body has a stack structure so each widget is technically placed upon each other, this allows for absolute positioning fo the widgets
        body: Stack(

          children:  [
            Container(
              //container that holds the actual logo image as well as all the information to regulate its sizing and positioning
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset('assets/logo.png',
                  width: 158,
                  height: 55,
                )
            ),

            //the next 2 containers are just containers that have text boxes
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 331, 0, 0),
              child: const Text ('What you will need.',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //to represent a list i used the \n twice between each line of text along with number indentations
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 408, 0, 0),
              child: const Text (' 1. UK Driving License, Full or Provisional\n\n 2. Front camera.\n\n 3. A Well lit room with a light background.\n\n 4. A clean flat surface to place your ID upon  ',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //at the bottom of the screen a yellow elevated button
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
                onPressed: () async {

                  //letting user know their session is beginning
                  showDialog(context: context, builder: (context){
                    return const CupertinoAlertDialog(
                      title: Text("Initialising session"),
                    );
                  });

                  final response = await get(Uri.parse(url));
                    jsonData = jsonDecode(response.body);
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>process(jsonData:jsonData)
                    ));
                    },
                child: const Text('I have those',
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
