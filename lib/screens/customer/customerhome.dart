import 'package:darzi/screens/customer/test.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatefulWidget {
  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {

  String _selectedGender;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('customer home page'),),
      backgroundColor: Colors.orange[200],
      body: Center(
        child: Center(
          child: Column(
              children: <Widget>[
                DropdownButtonFormField(
                  value: _selectedGender,
                  items: _dropDownItem(),
                  onChanged: (value){
                    _selectedGender=value;
                    switch(value){
                      case "Katol Naka" :
                      String key='katol';
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Test(mainkey:key)),
                        );
                        break;
                      case "Narmada Colony" :
                        String key='narmada';
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Test(mainkey:key)),
                        );
                        break;
                      case "Friends Colony" :
                        String key='friends';
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Test(mainkey:key)),
                        );
                        break;
                    }
                  },
                  hint: Text('Select region'),
                ),
              ],
            ),
        ),
      ),
      );
  }
}
List<DropdownMenuItem<String>> _dropDownItem() {
      List<String> ddl = ["Katol Naka", "Narmada Colony", "Friends Colony"];
      return ddl.map(
              (value) =>
              DropdownMenuItem(
                value: value,
                child: Text(value),
              )
      ).toList();
    }