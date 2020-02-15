import 'package:flutter/material.dart';
import 'package:my_boss/pages/tab_page1.dart';

class BossApp extends StatefulWidget {
  BossApp({Key key}) : super(key: key);

  @override
  _BossAppState createState() => _BossAppState();
}

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;


  @override
  void initState() {
    super.initState();
    _controller = new TabController(initialIndex: currentIndex, length: 4, vsync: this);
    onChanged = () {
      setState(() {
        /* controller改变的时候，让tab的下标动态改变 */
        currentIndex = _controller.index;
        print('content index change ${_controller.index}');
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'boss',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          TabPage(index:1),
          TabPage(index:2),
          TabPage(index:3),
          TabPage(index:4),
        ],
        controller: _controller,
      ),
      /* 方法一 */
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('首页')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.contacts),
      //       title: Text('商城')
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.create),
      //       title: Text('推荐'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.details),
      //       title: Text('我的')
      //     )
      //   ],
      //   currentIndex: currentIndex,
      //   selectedItemColor: Colors.greenAccent,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index){
      //     /* 切换tab时，需要动态改变controller的index */
      //     print('sub index change===$index');
      //     _controller.index = index;
      //   },
      // ),

      /* 方法二 */
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          indicator: BoxDecoration(),
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.school,
                color: currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
              child: Text('tab1'),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                color: currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
              child: Text('tab2'),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                color: currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
              child: Text('tab3'),
            ),Tab(
              icon: Icon(
                Icons.school,
                color: currentIndex == 3 ? Colors.blue : Colors.grey,
              ),
              child: Text('tab4'),
            )
          ],
          controller: _controller,
        ),
      ),
    );
  }
}