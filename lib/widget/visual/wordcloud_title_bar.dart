import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/widget/common/rota_rfr_ico_btn.dart' as comm;
import 'package:tifront/widget/visual/models/wordcloud_data.dart';
import 'package:tifront/widget/visual/wordcloud_edit_dialog.dart';

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
        duration: const Duration(milliseconds: 200), vsync: this);
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
                  List<WeightWord> _weightWordList = [];
                  Provider.of<WordcloudDataModel>(context)
                      .weightWordList
                      .forEach((element) {
                    _weightWordList.add(
                        WeightWord(weight: element.weight, word: element.word));
                  });
                  return MyDialog(
                    title: "哈哈哈哈",
                    content: "我是内容",
                    weightWordList: _weightWordList,
                  );
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
