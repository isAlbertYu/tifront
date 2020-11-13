import 'package:flutter/material.dart';
import 'package:tifront/widget/data_block.dart';

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
            flex: 3,
            child: DataBlock(),
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
