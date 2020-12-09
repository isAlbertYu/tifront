import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/common/rota_rfr_ico_btn.dart' as comm;
import 'package:tifront/widget/common/title_bar_textstyle.dart';
import 'package:tifront/widget/visual/models/weightword_copy_data.dart';
import 'package:tifront/widget/visual/models/weightword_data.dart';
import 'package:tifront/widget/visual/weightword_edit_dialog.dart';

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
              style: titleBarTextStyle(ScreenUtil.instance..init(context)),
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

/// 自定义的弹动编辑按钮
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
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              controller
                ..reset()
                ..forward();

              showDialog(
                context: context,
                builder: (context) {
                  WeightwordCopyData model =
                      Provider.of<WeightwordCopyData>(context, listen: false);
                  model.clearAll();
                  Provider.of<WordcloudDataModel>(context)
                      .weightWordList
                      .forEach((element) {
                    model.weightWordList.add(
                        WeightWord(weight: element.weight, word: element.word));
                  });
                  return MyDialog(
                    weightwordCopyData: model,
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
