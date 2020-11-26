import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/widget/articles/models/article_data.dart';
import 'package:tifront/widget/articles/models/article_list_block_rfr_btn_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleListBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleListRfrBtnModel>(
      ///参数 model 就是绑定的事件结果 ArticleListModel
      builder: (BuildContext context, ArticleListRfrBtnModel _, Widget child) {
        ArticleListModel articleListModel = ArticleListModel();
        return FutureBuilder(
          future: articleListModel.updateData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return ListView.builder(
                  itemCount: articleListModel.articleList.length,
                  itemBuilder: (context, index) {
                    Color topTextColor = Colors.black;
                    if (index <= 2) {
                      topTextColor = Colors.red[800];
                    }
                    return Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () async {
                          launch(
                            articleListModel.getArticle(index).url,
                          );
                        },
                        color: Colors.white70,
                        hoverColor: Colors.grey,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${index + 1}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  //字体粗细  粗体和正常
                                  color: topTextColor, //文字颜色
                                ),
                              ),
                            ),
                            MyVerticalDivider(),
                            //我的分隔竖线
                            Expanded(
                              flex: 13,
                              child: MyTextItem(
                                textContent:
                                    articleListModel.getArticle(index).title,
//                    textContent: '${itemTexts[index]["title"]}',
                                textColor: topTextColor, //文字颜色
                              ),
                            ),
                            MyVerticalDivider(),
                            //我的分隔竖线
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${articleListModel.getArticle(index).score}分',
                                //                    '${itemTexts[index]["score"]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  wordSpacing: 0.0,
                                  //单词间隙(负值可以让单词更紧凑)
                                  letterSpacing: 0.0,
                                  //字母间隙(负值可以让字母更紧凑)
                                  fontStyle: FontStyle.italic,
                                  //文字样式，斜体和正常
                                  fontSize: 15.0,
                                  //字体大小
                                  fontWeight: FontWeight.w900,
                                  //字体粗细  粗体和正常
                                  color: topTextColor, //文字颜色
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
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

class MyTextItem extends StatelessWidget {
  final String textContent;
  final Color textColor;

  MyTextItem({Key key, @required this.textContent, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0), //文本左边空一些位置
      alignment: Alignment(-1, 0),

      child: Text(
        textContent,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 13,
          //字母间隙(负值可以让字母更紧凑)
          letterSpacing: -0.5,
          fontWeight: FontWeight.w600,
          //字体粗细  粗体和正常
          color: this.textColor, //文字颜色
        ),
      ),
    );
  }
}

class MyVerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: VerticalDivider(
        thickness: 2,
        color: Colors.black26,
      ),
    );
  }
}
