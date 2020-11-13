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
          color: Colors.black,
          height: 50,
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              "${itemTexts[index]["title"]}",
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        );
      },
    );
  }
}
/*
articleList(
            itemTexts: [
              {
                "title": "DDD",
                "author": "yyyyyyyyyyy",
                "time": "443333",
              },
              {
                "title": "eeE",
                "author": "zzzzzzzzzzzzzz",
                "time": "88888888",
              },
              {
                "title": "XXX",
                "author": "sssssssssss",
                "time": "ssss",
              },
            ],
          ),
 */
