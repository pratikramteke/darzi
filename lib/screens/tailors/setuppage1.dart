import 'package:darzi/screens/tailors/setuppage2.dart';
import 'package:darzi/shared/about_us.dart';
import 'package:darzi/shared/contact_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setuppage1 extends StatefulWidget {

  @override
  _Setuppage1State createState() => _Setuppage1State();

}

class _Setuppage1State extends State<Setuppage1> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String _shopname;
  String _contactno;
  String _sepcialization;
  String dropdownvalue='gents';
  List<String> dropdownitems=<String>[
    'gents',
    'ladies',
    'both'
  ];

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _setupTextRow(){
    return Container(
      margin: EdgeInsets.only(left: 5, top: 30),
      child: Column(
        children: <Widget>[
          Text(
            "Set up your shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "Step 1 of 2",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  Widget _buildshopname(){
      return TextFormField(
        decoration: InputDecoration(hintText: 'Shop Name',border: OutlineInputBorder(),),
        keyboardType: TextInputType.text,
        validator: (val)=> val.isEmpty ? 'Please enter shop name' :null,
        onSaved: (String val) => _shopname = val,
      );
    }
  Widget _buildphoneno(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'Shop Contact Number',border: OutlineInputBorder(),),
      keyboardType: TextInputType.phone,
       validator: (val)=> val.length!=10 ? 'Please enter valid phone no' : null,
       onSaved: (String val) =>_contactno = val,
    );
  }

  Widget _buildspecialization(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'Specialization',border: OutlineInputBorder(),),
      onSaved: (String val) => _sepcialization = val,
    );
  }

  Widget _setupText() {
    return Container(
      padding: EdgeInsets.only(right:200),
      margin: EdgeInsets.only(left: 0, top: 25),
      child: Column(
        children: <Widget>[
          Text(
            "Stitching done for : ",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdown(){
    return DropdownButtonFormField(
      items: dropdownitems.map((String category) {
        return new DropdownMenuItem(
          value: category,
          child: Row(
            children: <Widget>[
              Text(category),
            ],
          )
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() => dropdownvalue = newValue);
      },
      value: dropdownvalue,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10,10),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text(""),backgroundColor: Colors.orangeAccent,),
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
      body: Material(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.all(24),
                    child: Column(
                      children:<Widget>[
                        _setupTextRow(),
                        SizedBox(height: 30,),
                        _buildshopname(),
                        SizedBox(height: 30.0,),
                        _buildphoneno(),
                        SizedBox(height: 30.0,),
                        _buildspecialization(),
                        _setupText(),
                        SizedBox(height: 30.0,),
                        _dropdown(),
                        SizedBox(height: 30.0,),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 180.0,
                          height: 50.0,
                          child:RaisedButton(
                            child: Text(
                              'Save & Continue',
                              style: TextStyle(color: Colors.black87,fontSize: 18),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              side: BorderSide(color: Colors.red)
                            ),
                            
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                                _formKey.currentState.save();
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Setuppage2(shopname: _shopname,contactno:_contactno,specilization:_sepcialization,dropdownvalue: dropdownvalue)),);
                              }
                            }
                          )
                        )
                      ],
                    )
                  ),
                ),
              ]
            )
          )
        )
      );
    }
  }