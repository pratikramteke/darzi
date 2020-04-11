import 'package:darzi/models/tailor.dart';
import 'package:darzi/screens/tailors/tailorhome.dart';
import 'package:darzi/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:darzi/screens/tailors/authenticatetailors.dart';
import 'package:provider/provider.dart';


class TailorsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Tailor>.value(
         value:AuthService().tailor,
         child: T(),
    );
  }
}
class T extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Tailor>(context);
    // return either Home or Authenticate widget
    if(user == null){
      return Authenticatetailor();
    }else{
      return TailorHomePage();
    }
  }
}