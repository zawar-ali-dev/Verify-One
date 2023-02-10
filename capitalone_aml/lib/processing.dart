import 'dart:convert';
import 'dart:io';
import 'package:capitalone_aml/failed_verification_no_restart.dart';
import 'package:capitalone_aml/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp;
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;


class processing extends StatelessWidget {
  var jsonData;
  processing(this.jsonData);


  @override
  Widget build(BuildContext context) {

    Proc(jsonData, context);
    return MaterialApp(

      home: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 58, 111, 1),
        body: Stack(
          //the main body has a stack structure so each widget is technically placed upon each other, this allows for absolute positioning fo the widgets
          //container that holds the actual logo image as well as all the information to regulate its sizing and positioning
          children:  [
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(0, 319, 0, 0),
                child: Image.asset('assets/logo.png',
                  width: 315,
                  height: 110,
                )
            ),


            //title for the page, letting the user know their information is being processes and verified
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 473, 0, 0),
              child: const Text ('Processing.',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            //next 2 containers explain what the user can do in the meantime in case the process takes a bit long
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 540, 0, 0),
              child: const Text ('Once we are done, we will let you know',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),


            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 584, 0, 0),
              child: const Text ('You can exit the app, but please do not close it',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void Proc(jsonData, context){
  //if both are successful then send the user to the success screen
  if (pollingFace(jsonData) == true && pollingID(jsonData) == true){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>success()
        ));
  } else {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>failedNoRestart()
        ));
  }
}

Future<bool> pollingFace(jsonData) async{
  //check if face proc was successful
  final response = await http.post(
    Uri.parse('https://aml.unioutlet.co.uk/processing'),
    headers: (<String, String>{
      'Authorization': 'Bearer ' + jsonData["session_id"],
    }),
    body: jsonEncode({"proc":"face-id-compare"}
    ),
  );
  //Return false if selfie and pic on ID do not match, else return true
  Map<String, dynamic> map = jsonDecode(response.body);
  if(map["status"] != 201){
    return false;
  }else{
    return true;
  }
}

Future<bool> pollingID(jsonData) async{
  final response = await http.post(
    Uri.parse('https://aml.unioutlet.co.uk/processing'),
    headers: (<String, String>{
      'Authorization': 'Bearer ' + jsonData["session_id"],
    }),
    body: jsonEncode({"proc":"ocr-detect-compare"}
    ),
  );
  //Return false if text entered does not match text on ID, else return true
  Map<String, dynamic> map = jsonDecode(response.body);
  if(map["status"] != 201){
    return false;
  }else{
    return true;
  }
}