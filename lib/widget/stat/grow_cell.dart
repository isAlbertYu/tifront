import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/stat/models/cell_data.dart';

class StatCell extends StatefulWidget {
  final String title;
  final int statCellId;

  StatCell({@required this.title, @required this.statCellId});

  @override
  _StatCellState createState() => new _StatCellState();
}

class _StatCellState extends State<StatCell>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    //角度从0变到90度
    animation = new Tween(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil scUtil = ScreenUtil.getInstance();
    scUtil.init(context);
    //return AnimatedImage(animation: animation,);
    return Container(
      color: Colors.yellow,
      margin: EdgeInsets.fromLTRB(20, 50, 20, 50),
      child: MouseRegion(
        onEnter: (_) {
          controller.forward();
        },
        onExit: (_) {
          controller.reverse();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: GrowIcon(animation: animation),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      wordSpacing: 0.0,
                      //单词间隙(负值可以让单词更紧凑)
                      letterSpacing: 0.0,
                      //字母间隙(负值可以让字母更紧凑)
                      fontStyle: FontStyle.normal,
                      //文字样式，斜体和正常
                      fontSize: scUtil.setSp(12),
                      //字体大小
                      fontWeight: FontWeight.w900,
                      //字体粗细  粗体和正常
                      color: Colors.black, //文字颜色
                    ),
                  ),
                  StatDataText(
                    statDataTextId: widget.statCellId,
                  ),
//                  Text(
//                    widget.number,
//                    textAlign: TextAlign.left,
//                    style: TextStyle(
//                      wordSpacing: 0.0,
//                      //单词间隙(负值可以让单词更紧凑)
//                      letterSpacing: 0.0,
//                      //字母间隙(负值可以让字母更紧凑)
//                      fontStyle: FontStyle.normal,
//                      //文字样式，斜体和正常
//                      fontSize: scUtil.setSp(12),
//                      //字体大小
//                      fontWeight: FontWeight.w900,
//                      //字体粗细  粗体和正常
//                      color: Colors.black, //文字颜色
//                    ),
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

/// 自定义的变大的图标
class GrowIcon extends StatelessWidget {
  final Animation<double> animation;

  GrowIcon({@required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Icon(
        Icons.access_time,
        size: 50,
        color: Colors.white,
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
}

class StatDataText extends StatelessWidget {
  final int statDataTextId;

  StatDataText({@required this.statDataTextId});

  @override
  Widget build(BuildContext context) {
    return Consumer<CellsDataModel>(
      ///参数 model 就是绑定的事件结果 ArticleListModel
      builder: (BuildContext context, CellsDataModel model, Widget child) {
        ScreenUtil scUtil = ScreenUtil.getInstance();
        scUtil.init(context);

        return Text(
          model.getCellData(statDataTextId).number,
          textAlign: TextAlign.left,
          style: TextStyle(
            wordSpacing: 0.0,
            //单词间隙(负值可以让单词更紧凑)
            letterSpacing: 0.0,
            //字母间隙(负值可以让字母更紧凑)
            fontStyle: FontStyle.normal,
            //文字样式，斜体和正常
            fontSize: scUtil.setSp(12),
            //字体大小
            fontWeight: FontWeight.w900,
            //字体粗细  粗体和正常
            color: Colors.black, //文字颜色
          ),
        );
      },
    );
  }
}
