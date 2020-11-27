import 'package:flutter/material.dart';
import 'package:tifront/widget/stat/models/cell_data.dart';

///文章列表的刷新Notifier
class CellsBlockRfrBtnModel extends ChangeNotifier {
////  bool isClicked;
//  CellsDataModel cellsDataModel;
//
//  CellsBlockRfrBtnModel() {
//    this.cellsDataModel = CellsDataModel();
//  }

  void refreshButtonIsClicked() {
//    this.cellsDataModel.updateData();
    notifyListeners();
  }
}
