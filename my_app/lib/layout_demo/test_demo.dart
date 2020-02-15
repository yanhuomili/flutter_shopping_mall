import 'package:flutter/material.dart';
import 'package:my_app/routers/application.dart';

class TestDemo extends StatefulWidget {
  TestDemo({Key key}) : super(key: key);

  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局demo'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          RaisedButton(
            onPressed: (){
              Application.router.navigateTo(context, '/bottomNavigationBar');
            },
            child: Text('bottomNavigationBarDemo'),
          )
        ],),
      ),
    );
  }
}