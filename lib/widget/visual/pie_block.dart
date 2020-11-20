import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class PieBlock extends StatefulWidget {
  @override
  _PieBlockState createState() => _PieBlockState();
}

class _PieBlockState extends State<PieBlock> {
  bool isCardView = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: SfCircularChart(
        title: ChartTitle(
            text: isCardView
                ? ''
                : 'Various countries population density and area'),
        legend: Legend(
            isVisible: isCardView ? false : true,
            overflowMode: LegendItemOverflowMode.wrap),
        series: _getPieSeries(),

        /// To enabe the tooltip and its behaviour.
        tooltipBehavior: TooltipBehavior(
          enable: true,
//          tooltipPosition: TooltipPosition.pointer,
//          duration: (duration ?? 2.0) * 1000,
        ),
      ),
    );
  }
}

List<PieSeries<ChartSampleData, String>> _getPieSeries() {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(x: 'Argentina', y: 505370, text: '45%'),
    ChartSampleData(x: 'Belgium', y: 551500, text: '53.7%'),
    ChartSampleData(x: 'Cuba', y: 312685, text: '59.6%'),
    ChartSampleData(x: 'Dominican Republic', y: 350000, text: '72.5%'),
    ChartSampleData(x: 'Egypt', y: 301000, text: '85.8%'),
    ChartSampleData(x: 'Kazakhstan', y: 300000, text: '90.5%'),
    ChartSampleData(x: 'Somalia', y: 357022, text: '95.6%')
  ];
  return <PieSeries<ChartSampleData, String>>[
    PieSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        dataLabelMapper: (ChartSampleData data, _) => data.x,
        startAngle: 100,
        endAngle: 100,
        pointRadiusMapper: (ChartSampleData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, labelPosition: ChartDataLabelPosition.outside))
  ];
}

class ChartSampleData {
  ChartSampleData({
    this.x,
    this.y,
    this.text,
  });

  final String x;
  final double y;
  final String text;
}
