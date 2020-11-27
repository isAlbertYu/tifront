import 'dart:convert';
import 'dart:math';

import 'package:tifront/common/http.dart';

class CellsDataModel{
  /// Internal, private state of the cart.
  List<CellData> dataCellsList = [];
  Random random = Random();
  static int x = 0;
//  CellsDataModel() {
//    dataCellsList.clear();
//    for (int i = 0; i < 6; i++) {
//      dataCellsList
//          .add(CellData(title: "今日采集量", number: '${random.nextInt(1000000)}'));
//    }
//  }


  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    dataCellsList.clear();
    for (var i = 0; i < 5; ++i) {
      dynamic jsondata = await TiHttp.getHttp("/stat_$i");
      var mydata = json.decode(jsondata) as String;
      dataCellsList.add(CellData(number: mydata));
    }
    dataCellsList.add(CellData(number: '${random.nextInt(1000000)}'));
  }

  /// 从服务器拉取数据
  Future updateData() async {
    await getDataFromServer();
  }


  CellData getCellData(int index) => this.dataCellsList[index];
}

class CellData {
  final String title;
  final String number;

  CellData({this.title, this.number});
}
