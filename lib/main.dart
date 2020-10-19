import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'home.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization =Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){

        if(snapshot.hasError){
          return Text('SomethingWentWrong',textDirection: TextDirection.ltr);
        }

        if(snapshot.connectionState == ConnectionState.done) {
          return ActualApp();
        }

        return Text('Loading',textDirection: TextDirection.ltr,);
      },
    );


  }
}

class ActualApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FinalHomePage2(),
    );
  }
}