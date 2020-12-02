import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/visual/models/wordcloud_data.dart';
import 'package:tifront/widget/visual/models/wordcloud_rfr_btn_model.dart';
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
        child: WordWrap(),
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

class WordWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<WordcloudRfrBtnModel>(
      ///参数 model 就是绑定的事件结果 ArticleListModel
      builder: (BuildContext context, WordcloudRfrBtnModel _, Widget child) {

        WordcloudDataModel model =
            Provider.of<WordcloudDataModel>(context, listen: false);

        print('WordWrap 重绘');
        return FutureBuilder(
          future: model.updateData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Consumer<WordcloudDataModel>(
                  ///参数 model 就是绑定的事件结果 ArticleListModel
                  builder: (BuildContext context, WordcloudDataModel model, Widget child) {
                    return Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 5, //主轴上子控件的间距
                      runSpacing: 5, //交叉轴上子控件之间的间距
                      children: model.weightWordClipList, //要显示的子控件集合
                    );
                  },);
              }
            } else {
              // 请求未结束，显示loading
              return UnconstrainedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 5,
                ),
              );
            }
          },
        );
      },
    );
  }
}
