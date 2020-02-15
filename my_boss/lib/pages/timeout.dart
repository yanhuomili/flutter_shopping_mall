import 'package:flutter/material.dart';
import 'dart:async';

class TimeOut extends StatefulWidget {
  TimeOut({Key key}) : super(key: key);

  @override
  _TimeOutState createState() => _TimeOutState();
}

class _TimeOutState extends State<TimeOut> {

  var timeout = Duration(seconds: 3);
  var ms = Duration(microseconds: 1000);

  startTimeout([int microseconds]) {
    var duration = microseconds == null ? timeout : ms*microseconds;
    return Timer(duration, handlerTimeout);
  }

  void handlerTimeout(){
    print('delay run it');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
        children: <Widget>[
          Text('timeOut 时间延迟测试'),
          RaisedButton(
            onPressed: (){
              startTimeout(3000);
              Timer(Duration(seconds: 2),(){
                print('2秒后执行');
              });
            },
            child: Text('点击'),
          )
        ],
      ),
    );
  }
}