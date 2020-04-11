import 'package:flutter/material.dart';


class Slide{
  final String imageurl;
  final String title;
  final String desc;
  
  Slide({
    @required this.imageurl,
    @required this.title, 
    @required this.desc
  });
}

final slideList = [
  
  Slide(
    imageurl: 'assets/images/tailorshop3.jpg',
    title: 'A gentleman never talks about his tailor',
    desc:''
  ),
  
  Slide(
    imageurl: 'assets/images/tailorshop2.jpg',
    title: 'If youre wearing suits and you want to create your own sense of style get to the tailor',
    desc: ''
  ),

  Slide(
    imageurl: 'assets/images/tailorshop.jpg',
    title: 'Just because a suit fits, doesn\'t mean it looks good. You need a tailor. You want to get bespoke ',
    desc: ''
  )
];