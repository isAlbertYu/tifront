import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/widget/stat/models/cells_block_rfr_btn_model.dart';

class StatTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 1,
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            child: Text(
              '实时监控数据',
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
            child: RotationRefreshIconButton(),
          ),
        ),
      ],
    );
  }
}

/// 自定义的旋转刷新按钮
class RotationRefreshIconButton extends StatefulWidget {
  @override
  _RotationRefreshIconButtonState createState() =>
      _RotationRefreshIconButtonState();
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
          CellsBlockRfrBtnModel model = context.read<CellsBlockRfrBtnModel>();
          model.refreshButtonIsClicked();
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
