import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 自定义的旋转刷新按钮
class RotationRefreshIconButton extends StatefulWidget {
  final ChangeNotifier rfrBtnModel;

  RotationRefreshIconButton({@required this.rfrBtnModel});

  @override
  _RotationRefreshIconButtonState createState() =>
      new _RotationRefreshIconButtonState();
}

class _RotationRefreshIconButtonState extends State<RotationRefreshIconButton>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    //角度从0变到90度
    animation = Tween(begin: 0.0, end: math.pi * 2).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //return AnimatedImage(animation: animation,);
    return AnimatedBuilder(
      animation: animation,
      child: IconButton(
        splashRadius: 1,
        iconSize: 25,
        color: Colors.white,
        splashColor: Colors.transparent,
        icon: Icon(Icons.refresh),
        onPressed: () {
          controller
            ..reset()
            ..forward();

          ///通知监听者
//          widget.rfrBtnModel.notifyListeners();
        },
      ),
      builder: (BuildContext ctx, Widget child) {
        return Center(
          child: Transform.rotate(
            angle: animation.value,
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
