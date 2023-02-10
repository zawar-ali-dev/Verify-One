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


class step1approval extends StatelessWidget {

  final urlSend = 'https://aml.unioutlet.co.uk/send';
  final urlProc = 'https://aml.unioutlet.co.uk/processing';
  File imageID;
  var jsonData;
  step1approval(this.imageID, this.jsonData);


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
              child: const Text ('Step 1',
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
              child: const Text ('Take a clear photo of your UK Driving licence. The image captured will be displayed in the space below',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
              child: Image.file(imageID,
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

                  //if they pressed continue, send the image over
                  List <int> imageIDBytes = imageID.readAsBytesSync();

                 await post(Uri.parse(urlSend),
                    headers: (<String, String>{
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                    body: jsonEncode(<String, String>{
                      "type" : "image",
                      "file" : "identification",
                      "key" : "hi",
                      "data" : base64Encode(imageIDBytes),
                    }),
                  );

                  //send a post request to /proc in order to check for glare
                  final response = await post(Uri.parse(urlProc),
                    headers: (<String, String>{
                      'Authorization': 'Bearer ' + jsonData["session_id"],
                    }),
                    body: jsonEncode(<String, String>{
                      "proc" : "glare-detect",
                    }),
                  );

                  //if glare was detected then send user to the "glare has been detected page", else they can carry on with the process
                  Map<String, dynamic> map = jsonDecode(response.body);
                  print(map['status'].toString());
                  if (map['status'].toString() != '201'){
                    print("glare detected");
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>glare(jsonData)
                    ));
                  } else {
                    print("no glare detected!");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>step2screen(imageID, jsonData)
                        ));
                  }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context)=>step2screen(imageID, jsonData)
                    //     ));
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
                      MaterialPageRoute(builder: (context)=>step1screen(jsonData: jsonData,)
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
