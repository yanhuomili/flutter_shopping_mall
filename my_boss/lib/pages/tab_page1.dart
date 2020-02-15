import 'package:flutter/material.dart';

// class TabPage extends StatelessWidget {
//   final index;
//   const TabPage({Key key, this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('tab1 页面$index'),
//     );
//   }
// }

class TabPage extends StatefulWidget {
  TabPage({Key key, this.index}) : super(key: key);
  final index;
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  var index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
          child: Text('tab1 页面$index'),
        ),
    );
  }
}