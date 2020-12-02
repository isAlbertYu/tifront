import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/widget/visual/models/wordcloud_data.dart';

//是权重关键词的一个副本，可以对其进行增删改，但不影响原数据。当点击提交修改时，更新原数据并发送至服务器
class WeightwordCopyData extends ChangeNotifier {
  List<WeightWord> weightWordList = List<WeightWord>();

  void updataWeightword(WordcloudDataModel originModel) {
    originModel.updateDataFromCopy(this.weightWordList);
  }

  void addAItem() {
    this.weightWordList.add(WeightWord(word: '请编辑', weight: 1));
    notifyListeners();
  }

  void removeAItem(int index) {
    this.weightWordList.removeAt(index);
    notifyListeners();
  }

  void changeAItem(int index, {String newWord, int newWeight}) {
    if (newWord != null) {
      this.weightWordList[index].word = newWord;
    }
    if (newWeight != null) {
      this.weightWordList[index].weight = newWeight;
    }
    notifyListeners();
  }

  void clearAll() {
    this.weightWordList.clear();
  }
}
