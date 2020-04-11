import 'package:darzi/screens/introslider/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {

  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 230,height: 210,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(slideList[index].imageurl) ,
                fit: BoxFit.cover,
              ),
          ),
        ),
        SizedBox(height: 10.0,),
        Text(
          slideList[index].title, 
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold, 
            color: Theme.of(context).backgroundColor,
          ),
        ),
        Text(
          slideList[index].desc, 
          style: TextStyle(
            fontSize: 22, 
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 10.0,),
      ],
    );
  }
}