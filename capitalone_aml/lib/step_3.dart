import 'package:capitalone_aml/step_3.1.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, ScaffoldMessenger, SnackBar, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';



class step3 extends StatelessWidget {
  File imageFace;
  File imageID;
  var jsonData;

  step3(this.imageFace, this.jsonData, this.imageID);

  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();
  final _formkey3 = GlobalKey<FormState>();
  TextEditingController _firstNameTEC = TextEditingController();
  TextEditingController _lastNameTEC = TextEditingController();
  TextEditingController _dobTEC = TextEditingController();

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
              child: const Text ('Step 3',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //text prompt to ensure that text is entered in the correct format
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 136, 0, 0),
              child: const Text ('Enter your details exactly as on your ID\n\nFor example if your name is Richàrd and on your ID it is Richard, please enter Richard.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //title for TextFormField
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 303, 0, 0),
              child: const Text ('First Name',
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
                  controller: _firstNameTEC,
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Please enter first name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    border: OutlineInputBorder(),
                    hintText: 'e.g. Joe ',
                  ),
                ),
              ),
            ),

            //title for TextFormField
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 395, 0, 0),
              child: const Text ('Last Name',
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
                    controller: _lastNameTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return "Please enter last name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'e.g. Bloggs ',
                    ),
                  ),
                )
            ),

            //title for TextFormField

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 487, 0, 0),
              child: const Text ('Date Of Birth (DD/MM/YYYY)',
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
                    controller: _dobTEC,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return "Please enter date of birth";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(255, 255, 255, 1),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'e.g. 21/07/1994 ',
                    ),
                  ),
                )
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
                onPressed: () {
                  var firstName = _firstNameTEC.text;
                  var lastName = _lastNameTEC.text;
                  var dob = _dobTEC.text;
                  if (_formkey1.currentState!.validate() && _formkey2.currentState!.validate() && _formkey3.currentState!.validate()){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>step3part2(firstName: firstName, lastName: lastName, dob: dob, imageID: imageID, jsonData: jsonData, imageFace: imageFace )
                        ));
                  }
                },
                child: const Text('  Continue  ',
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
