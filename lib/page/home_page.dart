import 'package:flutter/material.dart';
import 'package:tifront/widget/articles/article_list_area.dart';
import 'package:tifront/widget/stat/stat_area.dart';
import 'package:tifront/widget/visual/visual_area.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("威胁情报监控系统"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white70,
        child: Container(
          margin: EdgeInsets.all(10),
//          color: Colors.black54,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: ArticleListArea(),
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
