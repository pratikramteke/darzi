import 'package:darzi/screens/customer/customerhome.dart';
import 'package:darzi/screens/tailors/tailorswrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modules extends StatefulWidget {
  @override
  _ModulesState createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.blueAccent[100]),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top:80.0),
          child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Darzi",style: TextStyle(fontSize:  80.0,color: Colors.white)),
                Text("Find the Tailor",style: TextStyle(fontSize:  20.0,color: Colors.white)),
                
              ]
            ),
            SizedBox(height: 50.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(top:200.0)),
                Container(
                      height: 160.0,
                      width: 160.0,
                      child: RawMaterialButton(
                        fillColor: Colors.white,
                        splashColor: Colors.red,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle,size:50.0,color: Colors.orange[300],),
                            Text("Customer",style: new TextStyle(fontSize: 26.0,color: Colors.orange[300]),)
                          ],
                        ),
                        //onPressed: (){},
                        onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => CustomerHomePage()));},
                      ),
                    ),
                Container(
                      height: 160.0,
                      width: 160.0,
                      child: RawMaterialButton(
                        //elevation: 8.0,
                        fillColor: Colors.white,
                        splashColor: Colors.red,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.edit_location,size:50.0,color: Colors.orange[300],),
                            Text("Tailor",style: new TextStyle(fontSize: 26.0,color: Colors.orange[300]),)
                          ],
                        ),
                        onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => TailorsWrapper()),);},
                      ),
                    ),
              ],
              
            ),
            // Column(
            //   children: <Widget>[
            //     Container(
            //           height: 160.0,
            //           width: 160.0,
            //           child: RawMaterialButton(
            //             fillColor: Colors.white,
            //             splashColor: Colors.red,
            //             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 Icon(Icons.account_box,size:50.0,color: Colors.orange[300],),
            //                 Text("Admin",style: new TextStyle(fontSize: 26.0,color: Colors.orange[300]),)
            //               ],
            //             ),
            //             onPressed: (){},
            //             //onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => SignInPage()),);},
            //           ),
            //         ),
            //   ]
            // ),
          ],
          ),
        ),
      ),
    );
  }
}