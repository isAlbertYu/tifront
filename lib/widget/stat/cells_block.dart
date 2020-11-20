import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tifront/widget/stat/grow_cell.dart';
import 'package:tifront/widget/stat/models/cell_data.dart';

class CellBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CellsDataModel>(
      create: (context) => CellsDataModel(),
      child: CellRefreshBlock(),
    );
  }
}

class CellRefreshBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
//          Container(
//            height: 10,
//            child: RaisedButton(
//              onPressed: () {
//                CellsDataModel model = context.read<CellsDataModel>();
//                model.getDataFromServer();
//              },
//            ),
//          ),
          Expanded(
            flex: 1,
//              margin: EdgeInsets.all(10),
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
            flex: 1,
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
