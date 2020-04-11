import 'package:darzi/screens/introslider/getting_started_screen.dart';
import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Darzi",
        theme: ThemeData(primaryColor: Colors.orange[200]),
        home: GettingStartedScreen()
    );
  }
}