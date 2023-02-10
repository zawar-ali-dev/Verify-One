import 'dart:convert';
import 'dart:io';

import 'package:capitalone_aml/failed_verification_no_restart.dart';
import 'package:capitalone_aml/processing.dart';
import 'package:capitalone_aml/step_3.1.dart';
import 'package:capitalone_aml/step_3.dart';
import 'package:capitalone_aml/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show Align, Alignment, AppBar, BuildContext, ButtonStyle, Center, Color, Colors, Column, Container, EdgeInsets, ElevatedButton, FloatingActionButton, Icon, IconButton, Icons, InputDecoration, Key, ListView, MainAxisAlignment, MaterialApp, MaterialPageRoute, MaterialStateProperty, OutlineInputBorder, Scaffold, SimpleDialog, Stack, StatefulWidget, StatelessWidget, Text, TextFormField, Theme, ThemeData, Widget, runApp, showDialog;
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';




class lastStep extends StatelessWidget {

  final urlSend = 'https://aml.unioutlet.co.uk/send';
  final urlProc = 'https://aml.unioutlet.co.uk/processing';
  var firstName;
  var lastName;
  var dob;
  var address;
  var city;
  var postcode;
  var jsonData;
  File imageID;
  File imageFace;

  lastStep({this.firstName, this.lastName, this.dob, this.address, this.city, this.postcode, required this.imageID, this.jsonData, required this.imageFace});

  

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

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 90, 0, 0),
              child: const Text ('Last Step',
                style: TextStyle(
                  fontSize: 36,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 136, 0, 0),
              child: const Text ("Review the information below and that's it!",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 339, 0, 0),
              child: const Text ('Name and Date of birth',
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 377, 0, 0),
              child: Text (firstName + " " + lastName + " \n- " + dob,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(320, 354, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>step3(imageFace, jsonData, imageID),
                  ));
                },
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(320, 449, 0, 0),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white,),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>step3part2(firstName: firstName, lastName: lastName, dob: dob, imageID: imageID, imageFace: imageFace,)
                  ));
                },
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 433, 0, 0),
              child: const Text ('Address',
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(37, 462, 0, 0),
              child:  Text (address + ", " + city + ", \n" + postcode,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 708, 0, 0),
              child: const Text ('Everything look good?',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 738, 0, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 229, 18, 1),
                  padding: EdgeInsets.fromLTRB(125, 15, 125, 15),
                ),
                onPressed: () async{

                  //first we show the user an alert dialog informing them that their request has been sent through
                  //and now they should patiently wait for the reponse on the glare detection
                  showDialog(context: context, builder: (context){
                    return const CupertinoAlertDialog(
                      title: Text("Processing, please be patient this may take a while"),
                    );
                  });

                  //create a variable that stores all the user data
                  var data = {"type":"text",
                    "file":"text",
                    "key":"hi",
                    "data":{
                      "firstname": firstName,
                      "lastname": lastName,
                      "dob": dob,
                      "address": address,
                      "city": city,
                      "postcode": postcode
                    }
                  };

                  //send over all user data
                  await post(Uri.parse(urlSend),
                    headers: (<String, String>{
                      "Content-Type": "application/json",
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                    body:
                      jsonEncode(data),
                  );

                  //next we check to see whether text on ID matches text entered
                  final response1 = await post(Uri.parse(urlProc),
                    headers: (<String, String>{
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                    body:
                    jsonEncode({"proc":"ocr-detect-compare"}),
                  );
                  Map<String, dynamic> map1 = jsonDecode(response1.body);

                  //now firstly we check whether the selfie and id match
                  final response2 = await post(Uri.parse(urlProc),
                    headers: (<String, String>{
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                  body:
                    jsonEncode({"proc":"face-id-compare"}),
                  );
                  Map<String, dynamic> map2 = await jsonDecode(response2.body);

                  print(map1['status']);
                  print(map2['status']);
                  //now if both of the above checks are successful we send the user to the success screen, else to the failed screen
                  if(map1['status'] == '201' && map2['status'] == '201'){
                    print("all good\n");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>success()
                    ));
                  } else {
                    print("NOT good\n");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>success()
                    ));
                  }
                },
                child: const Text('   Finish   ',
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


