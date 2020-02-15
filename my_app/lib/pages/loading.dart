import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new RaisedButton(
        child: new Text('返回第一个页面'),
          onPressed: (){
//            Navigator.pop(context);//不给上一级页面返回参数
            Navigator.of(context).pop("这个是从第二个页面返回的数据");//给上一级页面返回参数
          }
      ),
    );
  }
}