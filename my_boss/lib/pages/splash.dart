import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _t;

  @override
  void initState(){
    super.initState();
    _t = Timer(Duration(seconds: 2), (){
      print('跳到主页面');
      Navigator.pushReplacementNamed(context, '/home');
      // Navigator.of(context)
    });
  }

  @override
  void dispose(){
    _t.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: EdgeInsets.only(top:150.0),
        child: Column(
          children: <Widget>[
            Text(
              'BOSS 直聘',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}