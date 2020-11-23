import 'package:flutter/material.dart';
import 'package:tifront/widget/articles/article_list_block.dart';
import 'package:tifront/widget/articles/article_list_title_bar.dart';

class ArticleListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //背景
        color: Colors.black54,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArticleListTitleBar(),
          Expanded(
//            flex: 17,
//            child: ArticleListBlock(itemTexts:articleListData),
            child: ArticleListBlock(),
          ),
        ],
      ),
    );
  }
}
