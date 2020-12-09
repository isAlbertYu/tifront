import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tifront/common/http.dart';

class PieDataModel {
  List<EachItemData> pieData = [];
  Random random = Random();

  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    pieData.clear();
    dynamic jsondata = await TiHttp.getHttp("/stat_8");
    var mydata = jsondata as List<dynamic>;

    for (var i = 0; i < mydata.length; ++i) {
      var o = mydata[i];
      pieData.add(EachItemData(xWebsite: o["name"], yValue: o["count"]));
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    await getDataFromServer();
  }
}

class EachItemData {
  EachItemData({this.xWebsite, this.yValue}) {
//    pointColor = Colors.blue[];
  }

  final String xWebsite;
  final int yValue;
  Color pointColor;
}
