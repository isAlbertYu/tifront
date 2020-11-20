import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphBlock extends StatefulWidget {
  @override
  _GraphBlockState createState() => _GraphBlockState();
}

class _GraphBlockState extends State<GraphBlock> {
  bool isCardView = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: SfCartesianChart(
        title: ChartTitle(text: isCardView ? '' : 'Internet Users - 2016'),
        plotAreaBorderWidth: 0,

        /// X axis as category axis placed here.
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            minimum: 0, maximum: 80, isVisible: false, labelFormat: '{value}M'),
        series: _getDefaultCategory(),
        tooltipBehavior:
            TooltipBehavior(enable: true, header: '', canShowMarker: false),
      ),
    );
  }

  /// Returns the list of chart series which need to render on the column chart.
  List<ColumnSeries<ChartSampleData, String>> _getDefaultCategory() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'South\nKorea', yValue: 39, pointColor: Colors.teal[300]),
      ChartSampleData(
          x: 'India',
          yValue: 20,
          pointColor: const Color.fromRGBO(53, 124, 210, 1)),
      ChartSampleData(x: 'South\nAfrica', yValue: 61, pointColor: Colors.pink),
      ChartSampleData(x: 'China', yValue: 65, pointColor: Colors.orange),
      ChartSampleData(x: 'France', yValue: 45, pointColor: Colors.green),
      ChartSampleData(
          x: 'Saudi\nArabia', yValue: 10, pointColor: Colors.pink[300]),
      ChartSampleData(x: 'Japan', yValue: 16, pointColor: Colors.purple[300]),
      ChartSampleData(
          x: 'Mexico',
          yValue: 31,
          pointColor: const Color.fromRGBO(127, 132, 232, 1))
    ];
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.yValue,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      )
    ];
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.yValue, this.pointColor});

  final String x;
  final double yValue;
  final Color pointColor;
}
