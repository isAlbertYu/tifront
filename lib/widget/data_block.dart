import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataBlock extends StatefulWidget {
  @override
  _DataBlockState createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            flex: 1,
//              margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: MyCell(),
                ),
                Expanded(
                  flex: 1,
                  child: MyCell(),
                ),
                Expanded(
                  flex: 1,
                  child: MyCell(),
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
                  child: MyCell(),
                ),
                Expanded(
                  flex: 1,
                  child: MyCell(),
                ),
                Expanded(
                  flex: 1,
                  child: MyCell(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCell extends StatefulWidget {
  @override
  _MyCellState createState() => _MyCellState();
}

class _MyCellState extends State<MyCell> {
  double originSize = 30;
  double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
//        print("onEnter");
        setState(() {
          iconSize = originSize * 1.5;
        });
      },
      onExit: (_) {
//        print("onExit");
        setState(() {
          iconSize = originSize;
        });
      },
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(5),
        color: Colors.pink,
        child: Icon(
          Icons.access_time,
          size: iconSize,
          color: Colors.white,
        ),
      ),
    );
  }
}

//class _DataBlockState extends State<DataBlock> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Colors.blue,
//      margin: EdgeInsets.all(10),
//      padding: EdgeInsets.all(10),
//      child: GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            mainAxisSpacing: 10,
//            crossAxisSpacing: 10,
//            crossAxisCount: 3,
//            childAspectRatio: 1 / 1.2),
//        children: [
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.search, size: 50, color: Colors.white,),
//          ),
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.print, size: 50, color: Colors.white,),
//          ),
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.http, size: 50, color: Colors.white,),
//          ),
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.ac_unit, size: 50, color: Colors.white,),
//          ),
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.access_alarm, size: 50, color: Colors.white,),
//          ),
//          Container(
//            color: Colors.pink,
//            child: Icon(Icons.phone_iphone, size: 50, color: Colors.white,),
//          ),
//        ],
//      ),
//    );
//  }
//}
