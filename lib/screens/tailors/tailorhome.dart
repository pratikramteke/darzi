import 'package:darzi/screens/tailors/finalhome.dart';
import 'package:darzi/screens/tailors/setuppage1.dart';
import 'package:darzi/shared/about_us.dart';
import 'package:darzi/shared/contact_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class TailorHomePage extends StatefulWidget {
  @override
  _TailorHomePageState createState() => _TailorHomePageState();
}

class _TailorHomePageState extends State<TailorHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
      Scaffold(
        appBar: AppBar(title:Text('darzi')),
        drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("${user?.displayName}"),
              accountEmail: Text("${user?.email}",style: TextStyle(color: Colors.white),),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                )
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg"),
                )
              ),
            ),
            new ListTile(
              title: new Text("About us"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: (){ 
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>  AboutUs()));
              }
            ),
            new ListTile(
                title: new Text("Contact us"),
                trailing: new Icon(Icons.forum),
                onTap: (){ 
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>  ContactUs()));
                }
              ),
            new ListTile(
              title: new Text("Close drawer button"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
            new ListTile(
              title: new Text("SignOut"),
              onTap: (){
                _auth.signOut();
              } 
            ),
          ],
        )
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child:Text('Setup Your Shop'),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
                onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => Setuppage1()));}
                ),
                SizedBox(height:40.0),
              RaisedButton(
                child:Text('User Dash Board'),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(100.0)),
                onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => UserDashboard()));}
                )
            ],
          ),
        ),
        backgroundColor: Colors.blue,
      )
    );
  }
}
