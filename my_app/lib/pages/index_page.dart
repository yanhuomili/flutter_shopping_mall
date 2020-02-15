import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/category.dart';
import 'package:my_app/pages/shopping_cart.dart';
import 'package:my_app/pages/personal.dart';

class GlobalIndexPage extends StatefulWidget {
  GlobalIndexPage({Key key}) : super(key: key);

  @override
  _GlobalIndexPageState createState() => _GlobalIndexPageState();
}

class _GlobalIndexPageState extends State<GlobalIndexPage> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  List<Widget> _bodyList = [Home(),Category(),ShoppingCart(),Personal()];
  List<String> _titleList = ['首页','分类','购物车','我的'];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_titleList[currentIndex]}'),
      ),
      body: Container(
        child: _bodyList[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12, // 选中文字的大小
        type: BottomNavigationBarType.fixed, // 显示未选中的文字
        onTap: (int index) {
          print('$index');
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('首页'),
            icon: Icon(
              Icons.home
            )
          ),
          BottomNavigationBarItem(
            title: Text('分类'),
            icon: Icon(
              Icons.category
            )
          ),
          BottomNavigationBarItem(
            title: Text('购物车'),
            icon: Icon(
              Icons.shopping_cart
            )
          ),
          BottomNavigationBarItem(
            title: Text('我的'),
            icon: Icon(
              Icons.person
            )
          )
        ],
      ),
    );
  }
}


// class GlobalIndexPage extends StatelessWidget {
//   const GlobalIndexPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('index'),
//       ),
//       body: Container(
//         child: Text('默认页面'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             title: Text('首页'),
//             icon: Icon(
//               Icons.home
//             )
//           ),
//           BottomNavigationBarItem(
//             title: Text('分类'),
//             icon: Icon(
//               Icons.category
//             )
//           ),
//           BottomNavigationBarItem(
//             title: Text('购物车'),
//             icon: Icon(
//               Icons.shopping_cart
//             )
//           ),
//           BottomNavigationBarItem(
//             title: Text('我的'),
//             icon: Icon(
//               Icons.person
//             )
//           )
//         ],
//       ),
//     );
//   }
// }