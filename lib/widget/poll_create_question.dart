import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PollCreateQuestion extends StatefulWidget {
  var formData;
  PollCreateQuestion(Map map, { Key? key , this.formData}) : super(key: key);

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

  Future<void> pollSetUp(dynamic data) async {
    CollectionReference polls = FirebaseFirestore.instance.collection('Polls');
    polls.add(data);
    return;
  }

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

  dynamic get(){
    return widget.formData;
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text("Poll Id: "),
                        //     Text(
                        //       generateRandomString(),
                        //       style: TextStyle(
                        //         backgroundColor: Colors.grey[300],
                        //       )
                        //     )
                        //   ],
                        // ),
                        // SizedBox(height: 8),
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
                        SizedBox(height: 50,),
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
                                try{
                                  pollSetUp(widget.formData);
                                }
                                catch(e){
                                  print(e);
                                }
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