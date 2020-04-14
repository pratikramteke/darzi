import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Datafetch extends StatefulWidget {
  @override
  _DatafetchState createState() => _DatafetchState();
}

class _DatafetchState extends State<Datafetch> {
  @override
  Widget build(BuildContext context) {
    //  final tailors = Provider.of<List<Tailors>>(context);

    // return ListView.builder(
    //   itemCount: tailors.length,
    //   itemBuilder: (context, index) {
    //     return FinalFetch(t: tailors[index]);
    //   },
    // );
    return StreamBuilder(
      stream: Firestore.instance.collection('tailors').document('IbbwWmMuztR6J1o8JxPpCBhMcsk1').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Text('loading');
        }
        var userdoc=snapshot.data;
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(userdoc['Gents Lower Body Stitching Price']),
            ),
            ListTile(
              title: Text(userdoc['Gents Upper Body Stitching Price']),
            ),
            ListTile(
              title: Text(userdoc['Gents Full Body Stitching Price']),
            )
          ],
        );
      }, 
    );
  }
}