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
//          color: Colors.purple,
          height: 50,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Material(color: Colors.white,
              child: Ink(

                child: InkWell(
                  hoverColor: Colors.red,
                  focusColor: Colors.grey,
                  splashColor: Colors.blue,
                  onTap: () {},
                  child: MyTextItem(
                    textContent: "${itemTexts[index]["title"]}",
                  ),
                ),
              ),
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
//                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment(-1, 0),
      decoration: new BoxDecoration(
        //背景
//        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
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
