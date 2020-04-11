import 'dart:ui';
import 'dart:async';
import 'package:darzi/screens/introslider/slide.dart';
import 'package:darzi/screens/introslider/slide_dots.dart';
import 'package:darzi/screens/introslider/slide_items.dart';
import 'package:darzi/screens/modules.dart';
import 'package:flutter/material.dart';

class GettingStartedScreen extends StatefulWidget {

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if(_currentPage < 2){
        _currentPage++;
      }
      else{
        _currentPage = 0;
      }

      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }


  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: <Widget>[
                        PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: slideList.length,
                          itemBuilder: (ctx, i) => SlideItem(i),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 25),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for(int i = 0 ; i < slideList.length; i++)
                                    if(i == _currentPage)
                                      SlideDots(true)
                                    else
                                      SlideDots(false)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  
                  FlatButton(child: Text('Get Started',style: TextStyle(fontSize: 20.0),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    padding: const EdgeInsets.all(15),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Modules()),);
                    },
                  
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}