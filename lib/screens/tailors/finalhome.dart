import 'package:darzi/services/auth.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  // final String shopname;
  // final String contactno;
  // final String specilization;
  // final String dropdownvalue;
  // final String shopaddress;
  // final String city;
  // final String currentItemSelected;
  // final String country;
  // final String pincode;
  //UserDashboard({Key key,this.shopname,this.contactno,this.specilization,this.dropdownvalue,this.shopaddress,this.city,this.currentItemSelected,this.country,this.pincode}): super(key:key);
  @override
  _UserDashboardState createState() => _UserDashboardState();
 
}
class _UserDashboardState extends State<UserDashboard> {
  final AuthService _auth = AuthService();
String shopname;
String contactno;
String specilization;
String dropdownvalue;
String shopaddress;
String city;
String currentItemSelected;
String country;
String pincode;
String _ubsprice;
String _lbsprice;
String _fbsprice;
String _ubsprice1;
String _lbsprice1;
String _fbsprice1;


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('data'),
      ),  
      
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.add),
          onPressed: (){
            AlertDialog alertDialog = AlertDialog(
              
              title: Center(child:Text('For Gents'),),
              
              content: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column (
                    children:<Widget>[
                      TextFormField(
                        
                        decoration: InputDecoration(labelText: "Upper Body Stitching Price"),
                        keyboardType:TextInputType.number,
                        onSaved: (String val) => _ubsprice = val,
                      ),
                      TextFormField(
                        
                        decoration: InputDecoration(labelText: "Lower Body Stitching Price"),
                        keyboardType:TextInputType.number,
                        onSaved: (String val) => _lbsprice = val,
                      ),
                      TextFormField(
                        
                        decoration: InputDecoration(labelText: "Full Body Stitching Price"),
                        keyboardType:TextInputType.number,
                        onSaved: (String val) => _fbsprice = val,
                      ),
                      SizedBox(height: 10.0,),
                      Text('For Ladies',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600)),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Upper Body Stitching Price"),
                        keyboardType:TextInputType.number,
                         onSaved: (String val) => _ubsprice1 = val,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Lower Body Stitching Price"),
                        keyboardType:TextInputType.number,
                         onSaved: (String val) => _lbsprice1 = val,
                      ),
                      TextFormField(
              
                        decoration: InputDecoration(labelText: "Full Body Stitching Price"),
                        keyboardType:TextInputType.number,
                        onSaved: (String val) => _fbsprice1 = val,
                      ),
                    ]
                  ),
                ),
              ),
              
              

              actions: <Widget>[
                Center(
                  child: RaisedButton(
                    child: Text('Cancel'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: RaisedButton(
                    child: Text('Add'),
                    onPressed: ()async{
                      if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                              print(shopname);
                              print(contactno);
                              print(specilization);
                              print(dropdownvalue);
                              print(shopaddress);
                              print(city);
                              print(currentItemSelected);
                              print(country);
                              print(pincode);
                              print(_ubsprice);
                              print(_lbsprice);
                              print(_fbsprice);
                              print(_ubsprice1);
                              print(_lbsprice1);
                              print(_fbsprice1);
                             dynamic result=await _auth.tailordataextra(_ubsprice,_lbsprice,_fbsprice,_ubsprice1,_lbsprice1,_fbsprice1);
                               if(result == null){
                                 setState(() => print("error"));
                               }
                      }
                      Navigator.of(context).pop();
                    }
                  )
                )
              ]
            );
            showDialog(context: context, barrierDismissible: true, builder: (BuildContext context) => alertDialog);
            return alertDialog;
          }
      )
      
    );
  }
}