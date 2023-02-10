import 'dart:io';

import 'package:capitalone_aml/step_2_approval.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, SimpleDialog, SimpleDialogOption, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp, showDialog;
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';


class step2screen extends StatelessWidget {
  var jsonData;
  File imageID;
  final picker = ImagePicker();

  step2screen(this.imageID, this.jsonData);

  @override
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


            //elevated yellow button to allow user to begin the second part of step 3
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
                child: const Text(' Choose Photo ',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 58, 111, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                onPressed: ()  {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (_) => CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                              onPressed: () async {
                                final pickedFile = await picker.pickImage(source: ImageSource.camera);
                                if (pickedFile == null) {
                                  print("NULLLLLLL\n");
                                } else {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>step2approval(File(pickedFile.path), jsonData, imageID)
                                      ));
                                }
                              },
                              child: const Text('Camera')),
                          CupertinoActionSheetAction(
                              onPressed: () async {
                                final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                if (pickedFile == null) {
                                  print("NULLLLLLL\n");
                                } else {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>step2approval(File(pickedFile.path), jsonData, imageID)
                                      ));
                                }
                              },
                              child: const Text('Gallery')),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

