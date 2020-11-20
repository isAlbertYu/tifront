import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/widget/articles/article_list_block.dart';
import 'package:tifront/widget/articles/article_list_title_bar.dart';
import 'package:tifront/widget/articles/models/refresh_btn_click.dart';

class ArticleListArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RefreshButtonModel>(
      create: (context) => RefreshButtonModel(),
      child: ArticleListRefreshArea(),
    );
  }
}

class ArticleListRefreshArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        //背景
        color: Colors.blue,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
//          Expanded(
//            flex: 1,
//            child: ArticleListTitleBar(),
//          ),
          ArticleListTitleBar(),
          Expanded(
//            flex: 17,
//            child: ArticleListBlock(itemTexts:articleListData),
            child: ArticleListBlock(),
          ),
//          ArticleListBlock(),
        ],
      ),
    );
  }
}
