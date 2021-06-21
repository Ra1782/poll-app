import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/poll_create_question.dart';
import 'package:flutter_gradients/flutter_gradients.dart';


class PollCreate extends StatefulWidget {
  const PollCreate({ Key? key }) : super(key: key);

  @override
  _PollCreateState createState() => _PollCreateState();
}

class _PollCreateState extends State<PollCreate> {
  // late Map<String, dynamic> pollData;
  // List<Widget> poll = [
  //   PollCreateQuestion({}),
  // ];
  // addQuestion(){
  //   setState(() {
  //     poll.add(PollCreateQuestion({}));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
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
                  children: [PollCreateQuestion({})],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: (){
                    //     addQuestion();
                    //   }, 
                    //   child: Text("Add question")
                    // ),
                    // ElevatedButton(
                    //   onPressed: (){
                    //     // for(int i = 0; i< poll.length; i++){
                    //     //   pollData[i.toString()] = {
                    //     //     // ignore: invalid_use_of_protected_member
                    //     //     'question': poll[i]
                    //     //   };
                        
                    //     }, 
                    //   child: Text("Create")
                    // ),
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