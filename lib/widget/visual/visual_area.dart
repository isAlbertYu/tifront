import 'package:flutter/material.dart';
import 'package:tifront/widget/visual/pie_block.dart';
import 'package:tifront/widget/visual/weightword_block.dart';


class VisualArea extends StatefulWidget {
  @override
  _VisualAreaState createState() => _VisualAreaState();
}

class _VisualAreaState extends State<VisualArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.yellow,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: WordCloudBlock(),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: PieBlock(),
          ),
        ],
      ),
    );
  }
}

