import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  final String title;
  IndexPage(this.title);
  // const IndexPage(String title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('首页 : $title'),
      ),
    );
  }
}

