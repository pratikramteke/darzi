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
              style: TextStyle(fontSize: 30.0,),
               textAlign: TextAlign.values[4],
            ),
            //Divider(height: 5,)
            Text("Our purpose is to provide the facility to find , compare and search the best tailors as well as experience plays which  plays a vital role.",
             style: TextStyle(fontSize: 30.0,),
                    textAlign: TextAlign.values[4],
            )
          ],
        )
      
      
      
      
      )
    );
  }
}