import 'package:flutter/material.dart';
import 'package:tifront/page/home_page.dart';

final _routes = {
  '/': (context) => HomePage(),
};

//settings: 包含有路由的名称，以及路由所需传递的参数
Route onGenerateRoute(RouteSettings settings) {
  final String routeName = settings.name; //路由名称
  final routePassArg = settings.arguments; //路由传递的参数
  final Function pageContentBuilder = _routes[routeName];
  if (pageContentBuilder != null) {
    if (routePassArg != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(
          context,
          argument: routePassArg,
        ),
//        settings: RouteSettings(arguments: routePassArg),
      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageContentBuilder(
          context,
        ),
      );
      return route;
    }
  }
  return null;
}
