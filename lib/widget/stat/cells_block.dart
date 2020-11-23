import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tifront/widget/stat/grow_cell.dart';
import 'package:tifront/widget/stat/stat_title_bar.dart';

class CellBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //背景
        color: Colors.blue,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          ///统计数据区块的标题栏
          StatTitleBar(),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: StatCell(title: "今日采集量", statCellId: 0),
                ),
                Expanded(
                  flex: 1,
                  child: StatCell(title: "今日访问量", statCellId: 1),
                ),
                Expanded(
                  flex: 1,
                  child: StatCell(title: "今日相关量", statCellId: 2),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: StatCell(title: "总采集量", statCellId: 3),
                ),
                Expanded(
                  flex: 1,
                  child: StatCell(title: "总相关量", statCellId: 4),
                ),
                Expanded(
                  flex: 1,
                  child: StatCell(title: "监听网站量", statCellId: 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
