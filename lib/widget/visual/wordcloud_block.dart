import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/widget/visual/wordcloud_title_bar.dart';

class WordCloudBlock extends StatefulWidget {
  @override
  _WordCloudBlockState createState() => _WordCloudBlockState();
}

class _WordCloudBlockState extends State<WordCloudBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //背景
        color: Colors.blue,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          WordcloudTitleBar(),
          Expanded(
            child: WordcloudCell(),
          ),
        ],
      ),
    );
  }
}

class WordcloudCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      width: double.infinity,
      child: SingleChildScrollView(
        child: WordClip(),
      ),
      decoration: BoxDecoration(
//        color: Colors.pink,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}

class WordClip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 5, //主轴上子控件的间距
      runSpacing: 5, //交叉轴上子控件之间的间距
      children: [
        MyClip(text: "大家好"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好啊啊啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大家好"),
        MyClip(text: "大啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
        MyClip(text: "大啊"),
        MyClip(text: "大家啊啊好"),
        MyClip(text: "大家好"),
      ], //要显示的子控件集合
    );
  }
}

class MyClip extends StatelessWidget {
  final String text;
  String avatartext;
  double textSize;

  MyClip({@required this.text}) {
    Random random = Random();
    int score = random.nextInt(9) + 1;
    avatartext = "$score";
    textSize = 14 + score * 1.6;
  }

  @override
  Widget build(BuildContext context) {
    return RawChip(
      avatar: CircleAvatar(
        backgroundColor: Colors.primaries[Random().nextInt(17)],
        child: Text(
          avatartext,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: textSize,
          ),
        ),
      ),
      label: Text(
        this.text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: textSize,
        ),
      ),
      elevation: 8,
      tapEnabled: true,
      onPressed: () {},
      onSelected: null,
    );
  }
}
