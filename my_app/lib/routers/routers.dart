import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';
import '../pages/index.dart';

class Routes {
  static String root = '/';
  static String indexPage = '/indexPage';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        String title = params['title'].first;
        print('main=======>index title is $title');
        // return IndexPage(title);
      }
    );

    router.define(indexPage, handler: indexHandler);
  }
}