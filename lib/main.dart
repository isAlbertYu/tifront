import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/common/global.dart';
import 'package:tifront/route/routes.dart';

//void main() => Global.init().then((e) => runApp(MyApp()));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[200],
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
