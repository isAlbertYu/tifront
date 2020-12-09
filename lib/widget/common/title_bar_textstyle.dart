import 'package:flutter/material.dart';
import 'package:tifront/util/screen_util.dart';

TextStyle titleBarTextStyle(ScreenUtil scUtil) {
  return TextStyle(
    wordSpacing: 0.0,
    //单词间隙(负值可以让单词更紧凑)
    letterSpacing: 0.0,
    //字母间隙(负值可以让字母更紧凑)
    fontStyle: FontStyle.normal,
    //文字样式，斜体和正常
    fontSize: scUtil.setSp(15),
    //字体大小
    fontWeight: FontWeight.w900,
    //字体粗细  粗体和正常
    color: Colors.black, //文字颜色
  );
}
