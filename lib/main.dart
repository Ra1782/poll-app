import 'package:flutter/material.dart';
import 'package:google_signin_example/page/home_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:google_signin_example/page/poll_create.dart';
// ignore: unused_import
import 'package:google_signin_example/widget/sign_up_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    // theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: HomePage(),
    routes: {
      '/home': (context) => HomePage(),
      '/createpoll': (context) => PollCreate(),
    },
  );
}