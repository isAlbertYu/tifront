import 'dart:convert';
import 'dart:math';

import 'package:tifront/common/http.dart';
import 'package:tifront/data/article_data.dart';

class ArticleListModel {
  /// Internal, private state of the cart.
  List<Article> articleList = [];
  Random random = Random();

  ArticleListModel() {
//    print("ArticleListModel构造方法--");
//    articleList.clear();
//    for (var o in articleListData) {
//      articleList.add(Article(
//          title: o["title"], score: '${random.nextInt(100)}', url: o["url"]));
////          title: o["title"],
////          score: o["score"],
////          url: o["url"]));
//    }
  }

  void up2() {
    print("ArticleListModel构造方法--");
    articleList.clear();
    for (var o in articleListData) {
      articleList.add(Article(
          title: o["title"], score: '${random.nextInt(10)}', url: o["url"]));
//          title: o["title"],
//          score: o["score"],
//          url: o["url"]));
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    print("从服务器拉取数据...");
    articleList.clear();
    Map<String, dynamic> jsondata = await TiHttp.getHttp("/article_list");
    var mydata = json.decode(jsondata['mydata']) as List<dynamic>;
    for (var i = 0; i < mydata.length; ++i) {
      var o = mydata[i];
      articleList
          .add(Article(title: o["title"], score: o["score"], url: o["url"]));
    }
  }

  /// 更新数据并通知组件刷新
//  void updateDataAndNotify() async {
//    await this.updateData();
//    notifyListeners();
//  }

  Article getArticle(int index) => this.articleList[index];
}

class Article {
  final String title;
  final String score;
  final String url;

  Article({this.title, this.score, this.url});

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        score = json['score'],
        url = json['url'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'score': score,
        'url': url,
      };
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
