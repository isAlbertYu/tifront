import 'dart:convert';
import 'dart:math';

import 'package:tifront/common/http.dart';

class ArticleListModel {
  /// Internal, private state of the cart.
  List<Article> articleList = [];
  Random random = Random();

  ArticleListModel();

  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    articleList.clear();
    dynamic jsondata = await TiHttp.getHttp("/stat_7");
    var mydata = jsondata as List<dynamic>;
    for (var i = 0; i < mydata.length; ++i) {
      var o = mydata[i];
      articleList
          .add(Article(title: o["ArticleName"], score: o["Score"], url: o["URL"]));
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    await getDataFromServer();
  }

  Article getArticle(int index) => this.articleList[index];
}

class Article {
  final String title;
  final int score;
  final String url;

  Article({this.title, this.score, this.url});

//  Article.fromJson(Map<String, dynamic> json)
//      : title = json['title'],
//        score = json['score'],
//        url = json['url'];
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//        'title': title,
//        'score': score,
//        'url': url,
//      };
}

///////////////////////////////////////////////////////////
//
//
//const String BASEURL = "http://localhost:9999/article_list";
//
//Future<Map<String, dynamic>> getHttp() async {
//  try {
//    Response<Map<String, dynamic>> response = await Dio().get(BASEURL);
//    return response.data;
//  } catch (e) {
//    print("我的dio错误--${e}");
//  }
//  return null;
//}
