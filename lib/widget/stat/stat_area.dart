import 'package:flutter/material.dart';
import 'package:tifront/widget/stat/cells_block.dart';
import 'package:tifront/widget/stat/graph_block.dart';

class StatArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatRefreshArea();
  }
}

class StatRefreshArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: CellBlock(),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: GraphBlock(),
          ),
        ],
      ),
    );
  }
}
