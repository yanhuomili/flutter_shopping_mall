import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';
import 'error.dart';
class Routes {
  static String root = '/';
  static String indexPage = '/indexPage';
  static String my = '/my';

  /* layout test dome */
  static String bottomNavigationBar = 'bottomNavigationBar';


  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params){
        String title = params['title'].first;
        print('main=======>index title is $title');
        return ErrorPage();
      }
    );

    router.define(indexPage, handler: indexHandler);
    router.define(my, handler: myHandler);

    /* layout test demo router */
    router.define(bottomNavigationBar, handler: bottomNavigationBarHandler);
  }
}