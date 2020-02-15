import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/index.dart';
import '../pages/my.dart';

Handler indexHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String title = params['title'].first;
    print('main>index title is $title');
    return IndexPage(title);
  }
);


Handler myHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    print('我的页面');
    return MyPage();
  }
);