import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/visual/models/wordcloud_data.dart';

class MyDialog extends Dialog {
  String title;
  String content;
  final List<WeightWord> weightWordList;

  MyDialog({this.title, this.content, this.weightWordList});

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
                color: Colors.black45,
              ),
              Expanded(
                flex: 11,
                child: DialogEditListView(
                  weightWordList: this.weightWordList,
                ),
              ),
              Divider(
                thickness: 3,
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.pop(context, "pop取消");
                      },
                      child: Text(
                        "取消",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      color: Colors.red,
                    ),
                    FlatButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.pop(context, "pop新增");
                      },
                      child: Text(
                        "新增",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      color: Colors.green,
                    ),
                    FlatButton(
                      height: 60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.pop(context, "pop确定");
                      },
                      child: Text(
                        "确定",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogEditListView extends StatefulWidget {
  final List<WeightWord> weightWordList;

  DialogEditListView({@required this.weightWordList});

  @override
  _DialogEditListViewState createState() => _DialogEditListViewState();
}

class _DialogEditListViewState extends State<DialogEditListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        itemCount: widget.weightWordList.length,
        itemBuilder: (context, index) {
          return MyTextField(
            weightWordList: widget.weightWordList,
            textFieldIndex: index,
            wordText: widget.weightWordList[index].word,
            weightText: widget.weightWordList[index].weight.toString(),
            wordTextController: TextEditingController(),
            weightTextController: TextEditingController(),
            onDelete: () {
              setState(() {
                widget.weightWordList.removeAt(index);
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            color: Colors.black38,
          );
        },
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final List<WeightWord> weightWordList;
  final int textFieldIndex;

  final String wordText;
  final String weightText;
  VoidCallback onDelete;
  TextEditingController wordTextController;
  TextEditingController weightTextController;

  MyTextField(
      {@required this.weightWordList,
      @required this.textFieldIndex,
      @required this.wordText,
      @required this.weightText,
      @required this.wordTextController,
      @required this.weightTextController,
      this.onDelete}) {
    this.wordTextController.value = TextEditingValue(
        selection: TextSelection.fromPosition(
            TextPosition(offset: this.wordText.length)));
    this.weightTextController.value = TextEditingValue(
        selection: TextSelection.fromPosition(
            TextPosition(offset: this.weightText.length)));

    this.wordTextController.text = this.wordText;
    this.weightTextController.text = this.weightText;
  }

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  Color iconColor = Colors.teal;
  IconData iconData = Icons.edit;
  Color editBorderColor = Colors.red; //编辑框的边框颜色
  bool editReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "${widget.textFieldIndex + 1}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                wordSpacing: 0.0,
                //单词间隙(负值可以让单词更紧凑)
                letterSpacing: 0.0,
                //字母间隙(负值可以让字母更紧凑)
                fontStyle: FontStyle.italic,
                //文字样式，斜体和正常
                fontSize: 30.0, //字体粗细  粗体和正常
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: TextField(
              controller: widget.wordTextController,
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
                    borderSide: BorderSide(width: 2, color: editBorderColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              readOnly: editReadOnly,
//              mouseCursor: MaterialStateMouseCursor.clickable,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: TextField(
              controller: widget.weightTextController,
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
                    borderSide: BorderSide(width: 2, color: editBorderColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              readOnly: editReadOnly,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        splashColor: Colors.black54,
                        onPressed: () {
                          setState(() {
                            if (this.iconData == Icons.edit) {
                              editReadOnly = false;
                              iconData = Icons.done;
                              iconColor = Colors.lightBlue;
                              editBorderColor = Colors.lightBlue;
                            } else if (this.iconData == Icons.done) {
                              editReadOnly = true;
                              iconData = Icons.edit;
                              iconColor = Colors.teal;
                              editBorderColor = Colors.teal;
                            }
                          });
                        },
                        splashRadius: 25,
                        icon: Icon(
                          iconData,
                          size: 30,
                          color: iconColor,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: IconButton(
                        splashColor: Colors.black54,
                        onPressed: widget.onDelete,
                        splashRadius: 25,
                        icon: Icon(
                          Icons.delete_forever,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.wordTextController.dispose();
    widget.weightTextController.dispose();
  }
}
