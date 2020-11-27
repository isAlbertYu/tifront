import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/common/http.dart';

class WordcloudDataModel extends ChangeNotifier{
  List<WeightWord> weightWordList = [];
  List<WeightWordClip> weightWordClipList = [];

  /// 从服务器拉取数据
  Future getDataFromServer() async {
    print("从服务器拉取数据...");
    weightWordList.clear();
    weightWordClipList.clear();
    dynamic jsonData = await TiHttp.getHttp("/stat_12");
    var myData = json.decode(jsonData) as List<dynamic>;

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
}

class WeightWord {
  final String word;
  final int weight;

  WeightWord({this.word, this.weight});
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
