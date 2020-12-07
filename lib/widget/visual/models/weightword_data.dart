import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/common/http.dart';

class WordcloudDataModel extends ChangeNotifier {
  List<WeightWord> weightWordList = [];
  List<WeightWordClip> weightWordClipList = [];

  /// 从服务器拉取数据
  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    weightWordList.clear();
    weightWordClipList.clear();
    dynamic jsonData = await TiHttp.getHttp("http://localhost:9999/stat_12");
    var myData_ = json.decode(jsonData) as Map<String, dynamic>;
    var myData = myData_["data"];
    for (var i = 0; i < myData.length; ++i) {
      var o = myData[i];
      weightWordList.add(WeightWord(word: o["word"], weight: o["weight"]));
      weightWordClipList
          .add(WeightWordClip(word: o["word"], weight: o["weight"]));
    }
  }

  Future updateData() async {
    await getDataFromServer();
  }

  void updateDataFromCopy(List<WeightWord> copyList) async {
    this.weightWordList.clear();
    this.weightWordClipList.clear();
    print('copyList.length=${copyList.length}');
    for (var i = 0; i < copyList.length; ++i) {
      var o = copyList[i];
      this.weightWordList.add(WeightWord(word: o.word, weight: o.weight));
      this
          .weightWordClipList
          .add(WeightWordClip(word: o.word, weight: o.weight));
    }
    await sendDataToServer();
    notifyListeners();
  }

  /// 发送数据给服务器
  Future sendDataToServer() async {
    Map<String, dynamic> jsonData = Map();
    jsonData["data"] = this.weightWordList;
    print('this.weightWordList=${this.weightWordList.length}');
    dynamic rtData = await TiHttp.postHttp('http://localhost:9999/stat_13', jsonData);
    var myData = json.decode(rtData) as Map<String, dynamic>;
    print('rtData=$myData');
  }

  void addAItem() {
    this.weightWordList.add(WeightWord(word: '', weight: 0));
    notifyListeners();
  }
}

class WeightWord {
  String word;
  int weight;

  WeightWord({this.word, this.weight});

  Map toJson() {
    Map map = Map();
    map["word"] = this.word;
    map["weight"] = this.weight;
    return map;
  }
}

class WeightWordClip extends StatelessWidget {
  final String word;
  final int weight;
  int colorIndex;
  double fontSize;

  WeightWordClip({this.word, this.weight}) {
    colorIndex = ((this.weight - 1) * 1.7).round();
    fontSize = 14 + 1.6 * weight;
  }

  @override
  Widget build(BuildContext context) {
    return RawChip(
      avatar: CircleAvatar(
        backgroundColor: Colors.primaries[this.colorIndex],
        child: Text(
          '$weight',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
      ),
      label: Text(
        this.word,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: fontSize,
        ),
      ),
      elevation: 8,
      tapEnabled: true,
      onPressed: () {},
      onSelected: null,
      selectedShadowColor: Colors.red,
    );
  }
}
