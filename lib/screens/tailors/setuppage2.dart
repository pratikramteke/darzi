import 'package:darzi/services/auth.dart';
import 'package:flutter/material.dart';

class Setuppage2 extends StatefulWidget {
  final String shopname;
  final String contactno;
  final String specilization;
  final String dropdownvalue;
  Setuppage2({Key key,this.shopname,this.contactno,this.specilization,this.dropdownvalue}): super(key:key);
  @override
  _Setuppage2State createState() => _Setuppage2State(this.shopname,this.contactno,this.specilization,this.dropdownvalue);
}

class _Setuppage2State extends State<Setuppage2> {
  final AuthService _auth = AuthService();
  String shopname;
  String contactno;
  String specilization;
  String dropdownvalue;
  _Setuppage2State(this.shopname,this.contactno,this.specilization,this.dropdownvalue);
  String _shopaddress;
  String _city;
  var _selectstate = ['Andhra Pradesh','Arunachal Pradesh','Assam','Bihar',
'Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh',
'Jammu and Kashmir','Jharkhand','Karnataka','Kerala','Madhya Pradesh',
'Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab',
'Rajasthan','Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh',
'Uttarakhand','West Bengal',];
  var currentItemSelected = 'Andhra Pradesh';
  String _country;
  String _pincode;
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final globalKey = GlobalKey<ScaffoldState>();

  Widget _setupTextRow() {
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
        //Divider(height: 20,),
        Text(
          "Step 2 of 2",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
        ),
        SizedBox(height: 10,)
      ],
    ),
  );
}

  Widget _buildshopaddress(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'Shop Address',border: OutlineInputBorder(),),
      keyboardType: TextInputType.text,
      validator: (val)=> val.isEmpty ? 'Shop address required' :null,
    
      onSaved: (String val) => _shopaddress = val,
    );
  }
  Widget _buildcity(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'City',border: OutlineInputBorder(),),
      keyboardType: TextInputType.url,
       validator: (val)=> val.isEmpty ? 'please enter city name' :null,
       onSaved: (String val) =>_city = val,
    );
  }
  Widget _dropdown(){
    return DropdownButtonFormField(
  items: _selectstate.map((String category) {
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
       setState(() => currentItemSelected = newValue);
     },
     value: currentItemSelected,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
     contentPadding: EdgeInsets.fromLTRB(10, 0, 10,10),
        )
    );
  
  }
  Widget _buildcountry(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'Country',border: OutlineInputBorder(),),
      //keyboardType: TextInputType.text,
      validator: (val)=> val.isEmpty ? 'please enter country name' :null,
       onSaved: (String val) => _country = val,
    );
  }
  Widget _buildpincode(){
    return TextFormField(
      decoration: InputDecoration(hintText: 'Pin Code',border: OutlineInputBorder(),),
      keyboardType: TextInputType.phone,
       validator: (val)=> val.isEmpty ? 'please enter pin code' :null,
       onSaved: (val) => _pincode = val,
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
             key: globalKey,

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.all(24),
                  child: Column(
                    children:<Widget>[
                      
                      
                      _setupTextRow(),
                      SizedBox(height: 10,),

                      _buildshopaddress(),
                      SizedBox(height: 20.0,),
                      _buildcity(),
                      SizedBox(height: 20.0,),
                        _dropdown(),
                      SizedBox(height: 20.0,),
                      _buildcountry(),
                      SizedBox(height: 20),
                      _buildpincode(),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: 140.0,
                        height: 40.0,
                        child:RaisedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.black87,fontSize: 22),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side: BorderSide(color: Colors.red)
                          ),
                          
                          onPressed: () async{
                            if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                            final snackBar = SnackBar(content: Text('Details Saved'));
                            globalKey.currentState.showSnackBar(snackBar);
                            print(shopname);
                              print(contactno);
                              print(specilization);
                              print(dropdownvalue);
                              print(_shopaddress);
                              print(_city);
                              print(currentItemSelected);
                              print(_country);
                              print(_pincode);
                            dynamic result=await _auth.tailordata(shopname,contactno,specilization,dropdownvalue,_shopaddress,_city,currentItemSelected,_country,_pincode);
                               if(result == null){
                                 setState(() => print("error"));
                               }
                            Navigator.pop(context);
                            Navigator.pop(context);
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
      );
    }
  }