import 'package:flutter/material.dart';
import 'package:my_app/pages/loading.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text('个人中心'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/loading').then((value){
                print('跳转到第二个页面');
              //  Fluttertoast.showToast(msg: value,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
             });

              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return LoadingPage('第一个页面传递过去的数据');
              // })).then((value){
              //   print(value);
              //   // Fluttertoast.showToast(msg: value,toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
              // });
            },
            child: Text('发送数据给第二个页面'),
          )
        ],
      ),
    );
  }
}
