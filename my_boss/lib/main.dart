import 'package:flutter/material.dart';
import './pages/timeout.dart';
import 'package:my_boss/pages/splash.dart';
import 'package:my_boss/pages/home.dart';

// void main(){
//     return runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'boss 直聘',
//       theme: ThemeData(
//         primaryColor: Colors.blue,
//       ),
//       home: Center(
//         child: Text('boss 直聘首页'),
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    title:'boss 直聘',
    theme: ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 0, 215, 198),
      accentColor: Colors.cyan[300]
    ),
    home: SplashPage(),
    routes: {
      '/home': (_) => BossApp()
    },
    // home: Scaffold(
    //   appBar: AppBar(
    //     title: Text('首页title'),
    //   ),
    //   body: Container(
    //     child: Column(
    //       children: <Widget>[
    //         Center(
    //           child: Text('首页'),
    //         ),
    //         TimeOut()
    //       ],
    //     )
    //   ),
    // ),
  ));
}

