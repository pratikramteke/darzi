import 'package:darzi/screens/tailors/registertailor.dart';
import 'package:flutter/material.dart';

import 'SignIntailor.dart';

class Authenticatetailor extends StatefulWidget {
  @override
  _AuthenticatetailorState createState() => _AuthenticatetailorState();
}

class _AuthenticatetailorState extends State<Authenticatetailor> {

  bool showSignIn=true;
  void toggleview(){
    setState(() => showSignIn=!showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIntailor(toggleview:toggleview);
    }else{
      return Registertailor(toggleview:toggleview);
    }
  }
}