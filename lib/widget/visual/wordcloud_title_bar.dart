import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tifront/common/global.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/common/rota_rfr_ico_btn.dart' as comm;
import 'dart:math' as math;

class WordcloudTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: FlipIconButton(),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
//            color: Colors.yellow,
            child: Text(
              '带权关键词',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22.0,
                height: 2.0,
                fontFamily: "serif",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.none,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerLeft,
            child: comm.RotationRefreshIconButton(
              rfrBtnModel: null,
            ),
          ),
        ),
      ],
    );
  }
}

/// 自定义的旋转刷新按钮
class FlipIconButton extends StatefulWidget {
  @override
  _FlipIconButtonState createState() => new _FlipIconButtonState();
}

class _FlipIconButtonState extends State<FlipIconButton>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    //大小从1倍到2倍
    animation = Tween(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    //return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: IconButton(
            splashRadius: 20,
            iconSize: 25,
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {
              controller
                ..reset()
                ..forward();

              showDialog(
                context: context,
                builder: (context) {
                  return MyDialog(
                    title: "哈哈哈哈",
                    content: "我是内容",
                  );
                  ;
                },
              );
            },
          ),
        ),
      ),
      builder: (BuildContext ctx, Widget child) {
        return Center(
          child: Transform.scale(
            scale: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class MyDialog extends Dialog {
  String title;
  String content;

  MyDialog({this.title, this.content});

  _showTimer(context) {
    var timer;
    timer = Timer.periodic(
      Duration(seconds: 3),
      (t) {
        print("关闭");
        Navigator.pop(context);
        t.cancel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    _showTimer(context);
    ScreenUtil scrUtil = ScreenUtil()..init(context);
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: scrUtil.setHeight(1500),
          width: scrUtil.setWidth(500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text("${this.title}"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                color: Colors.blue,
                child: Text(
                  "${this.content}",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
