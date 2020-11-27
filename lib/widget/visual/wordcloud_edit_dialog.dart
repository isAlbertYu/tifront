import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/visual/models/wordcloud_data.dart';

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
                      child: Text(
                        "关键词编辑",
                        style: TextStyle(
                          wordSpacing: 0.0,
                          //单词间隙(负值可以让单词更紧凑)
                          letterSpacing: 0.0,
                          //字母间隙(负值可以让字母更紧凑)
                          fontStyle: FontStyle.normal,
                          //文字样式，斜体和正常
                          fontSize: 25.0,
                          //字体大小
                          fontWeight: FontWeight.w500,
                          //字体粗细  粗体和正常
                          color: Colors.black, //文字颜色
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Expanded(
                child: DialogEditListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogEditListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount:
            Provider.of<WordcloudDataModel>(context).weightWordList.length,
        itemBuilder: (context, index) {
          WordcloudDataModel model =
              Provider.of<WordcloudDataModel>(context, listen: true);
          return MyTextField(
            wordText:'${model.weightWordList[index].word}',
            weightText:'${model.weightWordList[index].weight}',
            controller: TextEditingController(),
          );
        },
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final String wordText;
  final String weightText;
  TextEditingController wordTextController;
  TextEditingController weightTextController;

  MyTextField(
      {@required this.wordText,
      @required this.weightText,
      @required this.controller});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
//            height: 60,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller..text = widget.wordText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                //字体粗细  粗体和正常
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.black12,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              readOnly: true,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.controller..text = widget.weightText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                //字体粗细  粗体和正常
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.black12,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00000000)),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
