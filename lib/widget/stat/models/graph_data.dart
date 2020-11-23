import 'dart:math';

import 'package:flutter/cupertino.dart';

class GraphDataModel {
  List<EachDayData> chartData = [];
  Random random = Random();

  void getDataFromServer() {
    chartData.clear();
    for (int i = 0; i < 8; i++) {
      chartData.add(
        EachDayData(
            xDate: '${random.nextInt(100)}',
            yValue: random.nextInt(70)),
      );
    }
  }

  /// 从服务器拉取数据
  Future updateData() async {
    print("从服务器拉取数据...");
    getDataFromServer();
  }
}

class EachDayData {
  EachDayData({this.xDate, this.yValue}) {
//    pointColor = Colors.blue[];
  }

  final String xDate;
  final int yValue;
  Color pointColor;
}
