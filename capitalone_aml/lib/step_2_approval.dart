import 'dart:convert';
import 'dart:io';

import 'package:capitalone_aml/step_1.dart';
import 'package:capitalone_aml/step_2.dart';
import 'package:capitalone_aml/step_3.1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp, showDialog;
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'glare.dart';


class step2approval extends StatelessWidget {

  final urlSend = 'https://aml.unioutlet.co.uk/send';
  final urlProc = 'https://aml.unioutlet.co.uk/processing';
  File imageID;
  File imageFace;
  var jsonData;

  step2approval(this.imageFace, this.jsonData, this.imageID);


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),


        body: Stack(
          //the main body has a stack structure so each widget is technically placed upon each other, this allows for absolute positioning fo the widgets

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

            //title text for the page
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 90, 0, 0),
              child: const Text ('Step 2',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text prompt to ensure that text is entered in the correct format
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 136, 15, 0),
              child: const Text ('Capture a clear picture of your face. The image captured will be displayed in the space below',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
              child: Image.file(imageFace,
                height: 350,
                width: 350,),
            ),

            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.fromLTRB(0, 738, 20, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                ),
                onPressed: () async{
                  //first we show the user an alert dialog informing them that their request has been sent through
                  //and now they should patiently wait for the reponse on the glare detection
                  showDialog(context: context, builder: (context){
                    return const CupertinoAlertDialog(
                      title: Text("Processing, please be patient"),
                    );
                  });

                  //here we send the selfie over to the server
                  List <int> imageIDBytes = imageFace.readAsBytesSync();

                   await post(Uri.parse(urlSend),
                    headers: (<String, String>{
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                    body: jsonEncode(<String, String>{
                      "type" : "image",
                      "file" : "selfie",
                      "key" : "hi",
                      "data" : base64Encode(imageIDBytes),
                    }),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>step3(imageFace, jsonData, imageID)
                  ));
                },
                child: const Text(' Continue ',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 58, 111, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            //elevated yellow button to allow user to re- select the image
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>step2screen(imageID, jsonData,)
                      ));
                },
                child: const Text(' Re-select ',
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
