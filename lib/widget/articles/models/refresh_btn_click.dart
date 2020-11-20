import 'package:flutter/cupertino.dart';

class RefreshButtonModel extends ChangeNotifier {
//  bool isClicked;

  void refreshButtonIsClicked() {
    notifyListeners();
  }
}
