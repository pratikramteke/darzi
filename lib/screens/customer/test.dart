import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darzi/screens/customer/test1.dart';
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  final String mainkey;
  Test({Key key,this.mainkey}):super(key:key);
  @override
  _TestState createState() => _TestState(this.mainkey);
}

class _TestState extends State<Test> {
  String mainkey;
  String shopname;
  String address;
  String name;
  String contactno;
  String specilization;
  String city;
  String _ubsprice;
  String _lbsprice;
  String _fbsprice;
  String _ubsprice1;
  String _lbsprice1;
  String _fbsprice1;
  String check;
  String dropdownvalue='gents';
  List<String> dropdownitems=<String>[
    'gents',
    'ladies',
    'both'
  ];
  _TestState(this.mainkey);

  @override Widget build(BuildContext context) {
return Material(
  child:   Scaffold(
    appBar: new AppBar(title: Text("List of Darzi"),backgroundColor: Colors.orangeAccent,),
      body:new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(mainkey).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
     
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Card(
              color:Colors.grey,
                child: new ListTile(
                title: new Text(document['Shop Name']),
                subtitle: new Text(document['Shopaddress']),
                contentPadding:EdgeInsets.all(10.0) ,
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  shopname=document['Shop Name'];
                  address=document['Shopaddress'];
                  name=document['First Name'];
                  contactno=document['Mobile Number'];
                  specilization=document['Specilization'];
                  city=document['City'];
                  check=document['Stitching done for'];
                  _ubsprice=document['Gents Upper Body Stitching Price'];
                  _lbsprice=document['Gents Lower Body Stitching Price'];
                  _fbsprice=document['Gents Full Body Stitching Price'];
                  _ubsprice1=document['Ladies Upper Body Stitching Price'];
                  _lbsprice1=document['Ladies Lower Body Stitching Price'];
                  _fbsprice1=document['Ladies Full Body Stitching Price'];
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Test1(shopname:shopname,address:address,name:name,contactno:contactno,specilization:specilization,city:city,ubsprice:_ubsprice,lbsprice:_lbsprice,fbsprice:_fbsprice,ubsprice1:_ubsprice1,lbsprice1:_lbsprice1,fbsprice1:_fbsprice1,check:check)),);
                },
              ),
            );
          }).toList(),
        );
      },
    ),
  ),
);
}
}