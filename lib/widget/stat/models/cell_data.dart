import 'dart:math';

import 'package:flutter/material.dart';

class CellsDataModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<CellData> dataCellsList = [];
  Random random = Random();

  CellsDataModel() {
    dataCellsList.clear();
    for (int i = 0; i < 6; i++) {
      dataCellsList
          .add(CellData(title: "今日采集量", number: '${random.nextInt(1000000)}'));
    }
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void getDataFromServer() {
    dataCellsList.clear();
    for (int i = 0; i < 6; i++) {
      dataCellsList
          .add(CellData(title: "今日采集量", number: '${random.nextInt(1000000)}'));
    }
    notifyListeners();
  }

  CellData getCellData(int index) => this.dataCellsList[index];
}

class CellData {
  final String title;
  final String number;

  CellData({this.title, this.number});
}
