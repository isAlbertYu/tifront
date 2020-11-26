import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/common/global.dart';
import 'package:tifront/provider/providers.dart';
import 'package:tifront/route/routes.dart';
import 'package:tifront/widget/articles/models/article_list_block_rfr_btn_model.dart';
import 'package:tifront/widget/stat/models/cells_block_rfr_btn_model.dart';
import 'package:tifront/widget/stat/models/graph_block_rfr_btn_model.dart';

void main() {
//  debugPaintSizeEnabled = !true;
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
//    Global.init(context);

    Timer.periodic(
      Duration(minutes: 60),
      (timer) {
        context.read<CellsBlockRfrBtnModel>().refreshButtonIsClicked();
        context.read<ArticleListRfrBtnModel>().refreshButtonIsClicked();
        context.read<GraphBlockRfrBtnModel>().refreshButtonIsClicked();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[200],
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
