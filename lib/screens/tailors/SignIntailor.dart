import 'package:flutter/material.dart';
import 'package:darzi/services/auth.dart';

class SignIntailor extends StatefulWidget {
  final Function toggleview;
  SignIntailor({this.toggleview});

  @override
  _SignIntailorState createState() => _SignIntailorState();
}

class _SignIntailorState extends State<SignIntailor> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //text field state
  String _email = '';
  String _password = '';
  String error = '';

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
                          new TextFormField(
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
                            obscureText: true,
                            validator: (val) => val.length<6 ? 'Enter a password 6+ chars long': null,
                            onChanged: (val){
                              setState(() =>_password = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.orange[700],
                            child: Text(
                              'Sign in',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                dynamic result = await _auth
                                    .signIntailorWithEmailAndPassword(
                                        _email, _password);
                                if (result == null) {
                                  setState(() => error =
                                      'could not sign in with those credentials');
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
                            "Don't have an account?",
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
                              "Sign up",
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
          "Sign in to your account",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
        ),
      ],
    ),
  );
}
