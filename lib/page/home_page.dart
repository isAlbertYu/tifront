import 'package:flutter/material.dart';
import 'package:tifront/data/article_data.dart';
import 'package:tifront/widget/article_list_area.dart';
import 'package:tifront/widget/stat_area.dart';
import 'package:tifront/widget/visual_area.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("威胁情报"),
      ),
      body: Container(
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.all(10),
          color: Colors.purple,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: ArticleList(
                  itemTexts: articleListData,
                ),
              ),
              Flexible(
                flex: 3,
                child: StatArea(),
              ),
              Flexible(
                flex: 3,
                child: VisualArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
