import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tifront/common/http.dart';

class GraphDataModel {
  List<EachDayData> chartData = [];
  Random random = Random();

//  void getDataFromServer() {
//    chartData.clear();
//    for (int i = 0; i < 8; i++) {
//      chartData.add(
//        EachDayData(
//            xDate: '${random.nextInt(100)}',
//            yValue: random.nextInt(70)),
//      );
//    }
//  }
  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    chartData.clear();
    dynamic jsondata = await TiHttp.getHttp("/stat_11");
    var mydata = jsondata as List<dynamic>;

    for (var i = 0; i < mydata.length; ++i) {
      var o = mydata[i];
      chartData.add(EachDayData(xDate: o["date"], yValue1: o["count"]));
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    await getDataFromServer();
  }

  int getMaxValue() {
    return chartData.reduce((value, element) {
      if (value.yValue1 < element.yValue1) {
        return element;
      } else {
        return value;
      }
    }).yValue1;
  }
}

class EachDayData {
  EachDayData({this.xDate, this.yValue1}) {
//    pointColor = Colors.blue[];
    this.yValue2 = this.yValue1 ~/ 2;
  }

  final String xDate;
  final int yValue1;
  int yValue2;
  Color pointColor;
}
