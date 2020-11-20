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
  BuildContext context;
  ScreenUtil scrUtil;

  Global({@required this.context});//初始化全局信息，会在APP启动时执行

  Future init() async {
    scrUtil = ScreenUtil.getInstance();
    scrUtil.init(context);
  }
}
