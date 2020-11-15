import 'package:flutter/material.dart';
import 'dart:math';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
//import '../../../../model/sample_view.dart';
class GraphBlock extends StatefulWidget {
  @override
  _GraphBlockState createState() => _GraphBlockState();
}

class _GraphBlockState extends State<GraphBlock> {
  bool isCardView = false;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Monthly expense of a family'),
      legend: Legend(isVisible: !isCardView),
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelRotation: isCardView ? 0 : -45,
      ),
      primaryYAxis: NumericAxis(
          maximum: 200,
          axisLine: AxisLine(width: 0),
          labelFormat: '\${value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getStackedLineSeries(),
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
      ),
    );
  }
}

List<StackedLineSeries<ChartSampleData, String>> _getStackedLineSeries() {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(
        x: 'Food',
        y: 55,
        yValue: 40,
        secondSeriesYValue: 45,
        thirdSeriesYValue: 48),
    ChartSampleData(
        x: 'Transport',
        y: 33,
        yValue: 45,
        secondSeriesYValue: 54,
        thirdSeriesYValue: 28),
    ChartSampleData(
        x: 'Medical',
        y: 43,
        yValue: 23,
        secondSeriesYValue: 20,
        thirdSeriesYValue: 34),
    ChartSampleData(
        x: 'Clothes',
        y: 32,
        yValue: 54,
        secondSeriesYValue: 23,
        thirdSeriesYValue: 54),
    ChartSampleData(
        x: 'Books',
        y: 56,
        yValue: 18,
        secondSeriesYValue: 43,
        thirdSeriesYValue: 55),
    ChartSampleData(
        x: 'Others',
        y: 23,
        yValue: 54,
        secondSeriesYValue: 33,
        thirdSeriesYValue: 56),
  ];
  return <StackedLineSeries<ChartSampleData, String>>[
    StackedLineSeries<ChartSampleData, String>(
        width: 2,
        dataSource: chartData,
        xValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.x,
        yValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.y,
        name: 'Father',
        markerSettings: MarkerSettings(isVisible: true)),
    StackedLineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.x,
        yValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.yValue,
        name: 'Mother',
        markerSettings: MarkerSettings(isVisible: true)),
    StackedLineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.x,
        yValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.secondSeriesYValue,
        name: 'Son',
        markerSettings: MarkerSettings(isVisible: true)),
    StackedLineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.x,
        yValueMapper: (ChartSampleData chartSampleData, _) => chartSampleData.thirdSeriesYValue,
        name: 'Daughter',
        markerSettings: MarkerSettings(isVisible: true))
  ];
}

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue});

  final String x;
  final double y;
  final double yValue;
  final double secondSeriesYValue;
  final double thirdSeriesYValue;
}
