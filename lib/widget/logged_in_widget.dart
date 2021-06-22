import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:google_signin_example/page/home_page.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var color=Colors.transparent;
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Polling | Home"),
          backgroundColor: Colors.blueAccent,
          flexibleSpace: Image(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          brightness: Brightness.dark,

        ),
        backgroundColor: Colors.transparent,
        drawer: Drawer(

          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(

            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
          DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Polling App',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)

                      ),
                      CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.tealAccent.shade400,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(user.photoURL),

                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'),
              fit: BoxFit.cover,
            ),
        ),
        ),

              ListTile(
                title: Text("Current User: "+user.displayName,
                  style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                enabled: false,
              ),
              ListTile(
                leading: Icon(Icons.cabin_rounded,color: Colors.blueAccent, size: 30),
          title: Text('Home'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context,HomePage());
          },
        ),
           ListTile(
             leading: Icon(Icons.exit_to_app,color: Colors.blueAccent, size: 30),
                title: Text('Logout'),
                onTap: () {
                  final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
              ),

            ],),),
        body: Container(
          decoration: BoxDecoration(
            gradient: FlutterGradients.saintPetersburg(type: GradientType.linear,tileMode:TileMode.decal),
            image: new DecorationImage(
              image: new ExactAssetImage('assets/images/bg3.jpg'),
              fit: BoxFit.cover,
            ),

          ),

          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:28),
              //--------------------------row code here---------------------------


              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image7.jpg',
                      ),
                    ),
                  ),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     const ListTile(
                       leading: Icon(Icons.border_color_sharp, size: 40,color: Colors.white,),
                       title: Text(
                           'Create a Poll',
                           style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold)
                       ),
                       subtitle: Text(
                           'To create a new poll.',
                           style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold)
                       ),
                     ),
                     ButtonBar(
                       children: <Widget>[
                         RaisedButton(
                           child: const Text('Go'),

                           color: Colors.transparent,

                           onPressed: () {
                             Navigator.pushNamed(context, '/createpoll');
                           },
                         ),
                       ],
                     ),
                   ],
                 ),
                ),
              ),
              SizedBox(height:28),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image3.jpg',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.assignment_turned_in_outlined, size: 50,color: Colors.black,),
                        title: Text(
                            'Vote a Poll',
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'To vote in an existing poll.',
                            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Go',
                                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black)),

                            color: Colors.transparent,

                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:28),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image4.jpg',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.auto_stories_sharp, size: 50,color: Colors.black,),
                        title: Text(
                            'Polling History',
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'To view previously attempted polls.',
                            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Go',
                                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black)),

                            color: Colors.transparent,

                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),






              SizedBox(height:28),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image14.jpg',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.add_comment, size: 50,color: Colors.white,),
                        title: Text(
                            'Create a Poll',
                            style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'To create a new poll.',
                            style: TextStyle(fontSize: 14.0,color: Colors.white,fontWeight: FontWeight.bold)
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Go'),

                            color: Colors.transparent,

                            onPressed: () {
                              Navigator.pushNamed(context, "/createPoll");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:28),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image11.jpg',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.analytics_outlined, size: 50,color: Colors.black,),
                        title: Text(
                            'Vote a Poll',
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'To vote in an existing poll.',
                            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Go',
                                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black)),

                            color: Colors.transparent,

                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:28),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow.shade200,
                elevation: 10,

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                      fit: BoxFit.cover,  //I assumed you want to occupy the entire space of the card
                      image: AssetImage(
                        'assets/images/image17.jpg',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.add_task_rounded, size: 50,color: Colors.black,),
                        title: Text(
                            'Polling History',
                            style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                        ),
                        subtitle: Text(
                            'To view previously attempted polls.',
                            style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold)
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          RaisedButton(
                            child: const Text('Go',
                                style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black)),

                            color: Colors.transparent,

                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),





        ],
        ),
      ),
    ),
    ),
    );

  }
}
/*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '    Logged In as:          ',
                    //'   Logged In as:           ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 2.0,
                  ),

                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(user.photoURL),

                  ),
                  Text(
                    " "+ user.displayName+"   ",
                    style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                  ),

                ],
              ),*/