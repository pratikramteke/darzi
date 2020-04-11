import 'package:darzi/screens/customer/registercustomer.dart';
import 'package:flutter/material.dart';

import 'SignIncustomer.dart';

class Authenticatecustomer extends StatefulWidget {
  @override
  _AuthenticatecustomerState createState() => _AuthenticatecustomerState();
}

class _AuthenticatecustomerState extends State<Authenticatecustomer> {

  bool showSignIn=true;
  void toggleview(){
    setState(() => showSignIn=!showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIncustomer(toggleview:toggleview);
    }else{
      return Registercustomer(toggleview:toggleview);
    }
  }
}