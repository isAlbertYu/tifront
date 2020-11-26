import 'package:flutter/cupertino.dart';
import 'package:tifront/util/screen_util.dart';

//// 提供五套可选主题色
//const _themes = <MaterialColor>[
//  Colors.blue,
//  Colors.cyan,
//  Colors.teal,
//  Colors.green,
//  Colors.red,
//];

class Global {
  static ScreenUtil scrUtil;

//  factory Global(BuildContext context) {
//    return  Global._setScrUtil(context);
//  }
//
//  Global._setScrUtil(BuildContext context) {
//    this.scrUtil = ScreenUtil.getInstance()..init(context);
//  }

  //初始化全局信息，会在APP启动时执行
  static init(BuildContext context) {
    Global.scrUtil = ScreenUtil.getInstance()
      ..init(context);
  }

}