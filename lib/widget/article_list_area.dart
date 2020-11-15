import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  final List<Map<String, String>> itemTexts;

  ArticleList({Key key, @required this.itemTexts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemTexts.length,
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: new BoxDecoration(
            //背景
            color: Colors.yellow,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: FlatButton(
            onPressed: () {},
            hoverColor: Colors.red,
            child: MyTextItem(
              textContent: "${itemTexts[index]["title"]}",
            ),
          ),
        );
      },
    );
  }
}

class MyTextItem extends StatelessWidget {
  final String textContent;

  MyTextItem({Key key, @required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0), //文本左边空一些位置
      alignment: Alignment(-1, 0),

      child: Text(
        textContent,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
