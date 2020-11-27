import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tifront/widget/visual/wordcloud_edit_dialog.dart';
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("威胁情报监控系统"),
        centerTitle: true,
      ),
      body: MyDialog(
        title: "哈哈哈哈",
        content: "我是内容",
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //使用弹性曲线

    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: math.pi * 2).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(
        () {
          setState(() => {});
        },
      );

  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Transform.rotate(
        angle: animation.value,
        child: IconButton(
          iconSize: 200,
          color: Colors.blue,
//          splashColor:Colors.blue,
//          hoverColor: Colors.blue,
//          highlightColor: Colors.blue,
          icon: Icon(Icons.refresh),
          onPressed: (){
            //启动动画(正向执行)
            controller..reset()..forward();
            print("animation.value ${animation.value}");
          },
        ),
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
