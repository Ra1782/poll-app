import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      buildSignUp(context),
    ],
  );

  Widget buildSignUp(context) => Column(
    children: [
      Spacer(),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 175,
          child: Text(
            'Welcome Back To Polling App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Spacer(),
      GoogleSignupButtonWidget(),
      SizedBox(height: 5),
      Text(
        'Login to continue',
        style: TextStyle(fontSize: 16),
      ),
      Spacer(),
      // ElevatedButton(
      //   onPressed: (){
      //     Navigator.pushReplacementNamed(context, '/createpoll');
      //   },
      //   child: Text("Create poll")
      // )
    ],
  );
}