import 'package:capitalone_aml/last_step.dart';
import 'dart:io';
import 'package:capitalone_aml/step_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';



class step3part2 extends StatelessWidget {
  var firstName;
  var lastName;
  var dob;
  var jsonData;
  File imageID;
  File imageFace;

  step3part2({this.firstName, this.lastName, this.dob, required this.imageID, this.jsonData, required this.imageFace});

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  TextEditingController _addressTEC = TextEditingController();
  TextEditingController _cityTEC = TextEditingController();
  TextEditingController _postcodeTEC = TextEditingController();
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

            //page title
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 90, 0, 0),
              child: const Text ('Step 3.1',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text guide as to what the user should do in case their address differs from the one thats printed onto their ID
            //here i had to use textspan widget because i needed a certain part of the text to be in bold
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 136, 0, 0),
              child: RichText(text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Enter your address details exactly as they are on your ID\n\nIf your address is different, unfortunately we will be unable to verify your identity. For more information, click'),
                    TextSpan(text: ' here.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              ),
              ),
            ),

            //title for TextFormField
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 303, 0, 0),
              child: const Text ('First Line of your address',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text input box along wirth sample text to indicate the information that should be entered on it
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(37, 327, 37, 0),
                child: Form(
                  key: _formkey1,
                  child: TextFormField(
                    controller: _addressTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return "Please enter your full address";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'e.g. 1 Trent House',
                    ),
                  ),
                )
            ),

            //title for TextFormField
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 395, 0, 0),
              child: const Text ('City/Town',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text input box along wirth sample text to indicate the information that should be entered on it
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(37, 419, 37, 0),
                child: Form(
                  key: _formkey2,
                  child: TextFormField(
                    controller: _cityTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return "Please enter your city";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'e.g. Nottingham',
                    ),
                  ),
                )
            ),

            //title for TextFormField
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 487, 0, 0),
              child: const Text ('Postcode',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text input box along wirth sample text to indicate the information that should be entered on it
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(37, 511, 37, 0),
                child: Form(
                  key: _formkey3,
                  child: TextFormField(
                    controller: _postcodeTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return "Please enter your postcode";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'e.g. NG3 3HX ',
                    ),
                  ),
                )
            ),

            //elevated button to allow the user to conclude the process and begin the actual verification
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
                onPressed: () {
                  var address = _addressTEC.text;
                  var city = _cityTEC.text;
                  var postcode = _postcodeTEC.text;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>lastStep(firstName: firstName, lastName: lastName, dob: dob, address: address, city: city, postcode: postcode, imageID: imageID, jsonData: jsonData, imageFace: imageFace)
                      ));
                },
                child: const Text('   Review   ',
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
