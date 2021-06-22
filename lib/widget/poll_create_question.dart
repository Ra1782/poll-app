import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PollCreateQuestion extends StatefulWidget {
  Map<String, dynamic> formData = {};
  PollCreateQuestion({ Key? key}) : super(key: key);

  @override
  PollCreateQuestionState createState() => PollCreateQuestionState();
}

class PollCreateQuestionState extends State<PollCreateQuestion> {
  final _formKey = GlobalKey<FormState>();
  String? question;
  late List<String?> options = [];
  late List<Widget> _optionWidgetList = [
      TextFormField(
        decoration: InputDecoration(hintText: "Option"),
        validator: (value) {
          if(value == null || value.isEmpty){
            return "This field cannot be empty";
          }
          return null;
        },
        onSaved: (value){
          options.add(value);
        },
      ),
      TextFormField(
        decoration: InputDecoration(hintText: "Option"),
        validator: (value) {
          if(value == null || value.isEmpty){
            return "This field cannot be empty";
          }
          return null;
        },
        onSaved: (value){
          options.add(value);
        },
      ),
    ];

  addOption(){
     setState(() {
       _optionWidgetList.add(
        TextFormField(
          decoration: InputDecoration(hintText: "Option"),
          validator: (value) {
            if(value == null || value.isEmpty){
              return "This field cannot be empty";
            }
            return null;
          },
          onSaved: (value){
            setState(() {
              options.add(value);
            });
          },
        )
      );
     });
  }

  // dynamic setData(data) async{
  //   final prefs = await SharedPreferences.getInstance();
  //   var pollList = prefs.getStringList('newPoll');
  //   data = jsonEncode(data);
  //   pollList!.add(data);
  //   print("data: "+ data);
  //   prefs.setStringList('newPoll', pollList);
  // }

Future<void> pollSetUp(dynamic data) async {
  CollectionReference polls = FirebaseFirestore.instance.collection('Polls');
  polls.add(data);
  print(data);
  return;
}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: "Poll Question"),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                          onSaved: (value){
                             question = value;
                          },
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Options: "),
                                Column(
                                  children: _optionWidgetList
                                ),
                                SizedBox(height: 10,),
                                IconButton(
                                  hoverColor: Colors.blue,
                                  onPressed: (){
                                    addOption();
                                  }, 
                                  icon: Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                              onPressed: (){
                                if(!_formKey.currentState!.validate()){
                                  return;
                                }
                                _formKey.currentState!.save();

                                widget.formData = {
                                  "question": question,
                                  "options": options,
                                  "noOfUsers": 0
                                };
                                print(widget.formData);
                                // setData(widget.formData);
                                pollSetUp(widget.formData);
                                Navigator.pushNamed(context, '/home');
                             }, 
                              child: Text("Create"),
                            ),
                        ],
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}