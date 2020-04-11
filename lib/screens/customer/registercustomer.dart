import 'package:darzi/screens/customer/test.dart';
import 'package:flutter/material.dart';
import 'package:darzi/services/auth.dart';
class Registercustomer extends StatefulWidget {

  final Function toggleview;
  Registercustomer({this.toggleview});

  @override
  _RegistercustomerState createState() => _RegistercustomerState();
}

class _RegistercustomerState extends State<Registercustomer> {

  final AuthService _auth = AuthService();
  final _formkey =GlobalKey<FormState>();
  String _email;
  String _password;
  String _firstname;
  String _lastname;
  String _mobileno;
  String error='';


  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Stack(fit: StackFit.expand, children: <Widget>[
      new Image(
        image: new AssetImage("assets/images/background.jpg"),
        fit: BoxFit.cover,
      ),
      SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        welcomeTextRow(),
        signInTextRow(),
        new Form(
            key: _formkey,
            child: new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                            color: Colors.orange, fontSize: 20.0))),
                child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              labelText: "First Name",
                              prefixIcon: Icon(Icons.person,
                                  color: Colors.orange[200], size: 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                value.isEmpty ? 'First Name can\'t be empty' : null,
                            onChanged: (val){
                              setState(() =>_firstname = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          new TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              labelText: "Last Name",
                              prefixIcon: Icon(Icons.person,
                                  color: Colors.orange[200], size: 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) => value.isEmpty
                                ? 'Last Name can\'t be empty'
                                : null,              
                            onChanged: (val){
                              setState(() =>_lastname = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email,
                                  color: Colors.orange[200], size: 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                value.isEmpty ? 'Email can\'t be empty' : null,
                            onChanged: (val){
                              setState(() =>_email = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              labelText: "Mobile Number",
                              prefixIcon: Icon(Icons.phone,
                                  color: Colors.orange[200], size: 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                value.length!=10 ? 'Mobile No is invalid' : null,
                            onChanged: (val){
                              setState(() =>_mobileno = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: new InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock,
                                  color: Colors.orange[200], size: 20),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                value.isEmpty ? 'Password can\'t be empty' : null,
                            onChanged: (val){
                              setState(() =>_password = val);
                            },
                            obscureText: true,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.orange[700],
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () async {
                              print(_firstname);
                              print(_lastname);
                              print(_email);
                              print(_mobileno);
                              print(_password);
                              if(_formkey.currentState.validate()){
                              dynamic result=await _auth.registercustomerWithEmailAndPassword(_firstname,_lastname,_email,_mobileno,_password);
                                
                                if(result == null){
                                  setState(() => error = 'please supply a valid email');
                                }
                                else{
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => Test()),);
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 16.0),
                          ),
                          Text(
                            "Have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20
                                ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggleview();
                              print("Routing to Sign up screen");
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.orange[200],
                                  fontSize:20,
                               ),
                             )
                           )
                          ]
                        )
                      )
                    )
                  ),
                ]
              )
            )
          ]
        )
      )
    );
  }
}

Widget welcomeTextRow() {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 70),
    child: Row(
      children: <Widget>[
        Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 70,
          ),
        ),
      ],
    ),
  );
}

Widget signInTextRow() {
  return Container(
    margin: EdgeInsets.only(left: 30),
    child: Row(
      children: <Widget>[
        Text(
          "Register your account",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
        ),
      ],
    ),
  );
}