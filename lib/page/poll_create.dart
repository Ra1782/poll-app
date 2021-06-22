import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/poll_create_question.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PollCreate extends StatefulWidget {
  const PollCreate({ Key? key }) : super(key: key);

  @override
  _PollCreateState createState() => _PollCreateState();
}

Future<void> pollSetUp(dynamic data) async {
  CollectionReference polls = FirebaseFirestore.instance.collection('Polls');
  polls.add(data);
  return;
}

class _PollCreateState extends State<PollCreate> {
  late Map<String, dynamic> pollData;
  List<Widget> poll = [
    PollCreateQuestion(),
  ];
  addQuestion(){
    setState(() {
      poll.add(PollCreateQuestion());
    });
  }
  createInstance() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('newPoll', []);
  }
  @override
  Widget build(BuildContext context) {
    createInstance();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Create a poll"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: FlutterGradients.overSun(type: GradientType.linear, tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: poll,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        addQuestion();
                      }, 
                      child: Text("Add question")
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        final prefs = await SharedPreferences.getInstance();
                        dynamic temp =  prefs.getStringList('newPoll');
                        print(temp);
                        for (int i = 0; i < temp!.length; i++){
                          temp[i] = json.decode(temp[i]);
                        }
                        print(temp);
                        var data = {
                          'poll': temp
                        };
                        print(data);
                        try{
                          pollSetUp(data);
                        }
                        catch(e){
                          print(e);
                        }
                        Navigator.pushNamed(context, '/home'); 
                      }, 
                      child: Text("Create")
                    ),
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}