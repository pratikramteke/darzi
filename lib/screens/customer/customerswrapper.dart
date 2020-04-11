import 'package:darzi/models/customer.dart';
import 'package:darzi/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticatecustomers.dart';
import 'customerhome.dart';

class CustomersWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Customer>.value(
         value:AuthService().customer,
         child: C(),
    );
  }
}
class C extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Customer>(context);
    // return either Home or Authenticate widget
    if(user == null){
      return Authenticatecustomer();
    }else{
      return CustomerHomePage();
    }
  }
}