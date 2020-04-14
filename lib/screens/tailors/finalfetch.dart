import 'package:darzi/models/tailors.dart';
import 'package:flutter/material.dart';

class FinalFetch extends StatelessWidget {
  final Tailors t;
  FinalFetch({this.t});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(t.city),
        ),
      ),
    );
  }
}