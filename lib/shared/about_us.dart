import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("About us"),backgroundColor: Colors.redAccent,),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text("Darzi is a mobile application, Run by @ S.B Jain Institute of Technology Management and Research.", 
              style: TextStyle(fontSize: 25.0,),
               textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15.0,),
            //Divider(height: 5,)
            Text("Our purpose is to provide the facility to find , compare and search the best tailors as well as experience plays which  plays a vital role.",
             style: TextStyle(fontSize: 25.0,),
                    textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15.0,),
            Text("Darzi is led by its co-founders Prateek Motwani & Prateek Ramteke"+
              " who formed the fast growing application in early 2020.",
             style: TextStyle(fontSize: 25.0,),
                    textAlign: TextAlign.justify,
            ),
          ],
        )
      )
    );
  }
}