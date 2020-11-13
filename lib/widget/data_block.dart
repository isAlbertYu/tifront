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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.2),
        children: [
          Container(
            color: Colors.pink,
            child: Icon(Icons.search, size: 50, color: Colors.white,),
          ),
          Container(
            color: Colors.pink,
            child: Icon(Icons.print, size: 50, color: Colors.white,),
          ),
          Container(
            color: Colors.pink,
            child: Icon(Icons.margin, size: 50, color: Colors.white,),
          ),
          Container(
            color: Colors.pink,
            child: Icon(Icons.ac_unit, size: 50, color: Colors.white,),
          ),
          Container(
            color: Colors.pink,
            child: Icon(Icons.access_alarm, size: 50, color: Colors.white,),
          ),
          Container(
            color: Colors.pink,
            child: Icon(Icons.ac_unit_sharp, size: 50, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
