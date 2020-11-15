import 'package:flutter/material.dart';
import 'package:tifront/widget/data_block.dart';
import 'package:tifront/widget/graph_block.dart';

class StatArea extends StatefulWidget {
  @override
  _StatAreaState createState() => _StatAreaState();
}

class _StatAreaState extends State<StatArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: DataBlock(),
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
