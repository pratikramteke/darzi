import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Test1 extends StatefulWidget {
  final String shopname;
  final String address;
  final String name;
  final String contactno;
  final String specilization;
  final String city;
  final String check;
  final String ubsprice;
  final String lbsprice;
  final String fbsprice;
  final String ubsprice1;
  final String lbsprice1;
  final String fbsprice1;
  Test1({Key key,this.shopname,this.address,this.name,this.contactno,this.specilization,this.city,this.ubsprice,this.lbsprice,this.fbsprice,this.ubsprice1,this.lbsprice1,this.fbsprice1,this.check}):super(key:key);
  @override
  _Test1State createState() => _Test1State(this.shopname,this.address,this.name,this.contactno,this.specilization,this.city,this.ubsprice,this.lbsprice,this.fbsprice,this.ubsprice1,this.lbsprice1,this.fbsprice1,this.check);
}

class _Test1State extends State<Test1> {
  String shopname;
  String address;
  String name;
  String contactno;
  String specilization;
  String city;
  String check;
  String ubsprice;
  String lbsprice;
  String fbsprice;
  String ubsprice1;
  String lbsprice1;
  String fbsprice1;

  _Test1State(this.shopname,this.address,this.name,this.contactno,this.specilization,this.city,this.ubsprice,this.lbsprice,this.fbsprice,this.ubsprice1,this.lbsprice1,this.fbsprice1,this.check);
  @override
  Widget build(BuildContext context) {
    return Material(
      child:  Scaffold(
        appBar: AppBar(title: Text('Darzi Details'),),
        body:  AlertDialog(
          backgroundColor: Colors.grey,
          content: new SingleChildScrollView(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Center(child: Text('DARZI DATA',textScaleFactor: 1.5,)),
                ),
                ListTile(
                  title: Text('SHOPNAME:'),
                  subtitle: Text(shopname,textScaleFactor: 1.3,),
                ),
                ListTile(
                  title: Text('ADDRESS'),
                  subtitle: Text(address,textScaleFactor: 1.3),
                  trailing: Icon(Icons.edit_location),
                  onTap:()async{
                    final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$address+$city";
                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);
                    }
                    else {
                      throw "Couldn't launch URL";
                    }
                  }
                ),
                ListTile(
                  title: Text('NAME'),
                  subtitle: Text(name,textScaleFactor: 1.3)
                ),
                ListTile(
                  title: Text('CONTACT NO'),
                  subtitle: Text(contactno,textScaleFactor: 1.3),
                  trailing: Icon(Icons.call),
                  onTap: ()async{
                    final String no = "tel://$contactno";
                    if(await canLaunch(no)){
                      await launch(no);
                    }else{
                      throw "Couldn't launch";
                    }
                  }
                ),
                ListTile(
                  title: Text('SPECILIZATION'),
                  subtitle: Text(specilization,textScaleFactor: 1.3)
                ),
                ListTile(
                  title: Text('CITY'),
                  subtitle: Text(city,textScaleFactor: 1.3)
                ),
                if(check=='gents' || check=='both')
                ListTile(
                  title: Text('For Gents',textScaleFactor: 1.3,)
                ),
                if(ubsprice!="" && check=='gents' || check=='both')
                ListTile(
                  title: Text('Upper Body'),
                  subtitle: Text(ubsprice,textScaleFactor: 1.3)
                ),
                if(lbsprice!="" && check=='gents' || check=='both')
                ListTile(
                  title: Text('Lower Body'),
                  subtitle: Text(lbsprice,textScaleFactor: 1.3)
                ),
                if(fbsprice!="" && check=='gents' || check=='both')
                ListTile(
                  title: Text('Full Body'),
                  subtitle: Text(fbsprice,textScaleFactor: 1.3)
                ),
                if(check=='ladies' || check=='both' || check=='both')
                ListTile(
                  title: Text('For Ladies',textScaleFactor: 1.3),
                ),
                if(ubsprice1!="" && check=='ladies' || check=='both')
                ListTile(
                  title: Text('Upper Body'),
                  subtitle: Text(ubsprice1,textScaleFactor: 1.3)
                ),
                if(lbsprice1!="" && check=='ladies' || check=='both')
                ListTile(
                  title: Text('Lower Body'),
                  subtitle: Text(lbsprice1,textScaleFactor: 1.3)
                ),
                if(fbsprice1!="" && check=='ladies' || check=='both')
                ListTile(
                  title: Text('Full Body'),
                  subtitle: Text(fbsprice1,textScaleFactor: 1.3)
                ),
                GestureDetector(
                  onTap: (){},
                  child: new Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  ),
                )
              ]
            )
          ),
        )
      )
    );
  }
}
