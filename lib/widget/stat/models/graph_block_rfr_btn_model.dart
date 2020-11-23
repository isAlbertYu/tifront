import 'package:flutter/material.dart';

///文章列表的刷新Notifier
class GraphBlockRfrBtnModel extends ChangeNotifier {
//  bool isClicked;

  void refreshButtonIsClicked() {
    notifyListeners();
  }
}
