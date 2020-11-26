import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/stat/models/graph_block_rfr_btn_model.dart';
import 'package:tifront/widget/stat/models/graph_data.dart';

class GraphBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: ChartCell(),
    );
  }
}

class ChartCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GraphBlockRfrBtnModel>(
      ///参数 model 就是绑定的事件结果 ArticleListModel
      builder: (BuildContext context, GraphBlockRfrBtnModel _, Widget child) {
        ScreenUtil scUtil = ScreenUtil.getInstance();
        scUtil.init(context);
        GraphDataModel model = GraphDataModel();
        return FutureBuilder(
          future: model.updateData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return GraphChart(model: model);
              }
            } else {
              // 请求未结束，显示loading
              return UnconstrainedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 5,
                ),
              );
            }
          },
        );
      },
    );
  }

  /// Returns the list of chart series which need to render on the column chart.

}

class GraphChart extends StatelessWidget {
  final GraphDataModel model;

  GraphChart({@required this.model});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
          text: '近15日文章采集量',
          textStyle: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            height: 2.0,
            fontFamily: "serif",
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            decoration: TextDecoration.none,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
        legend: Legend(
          textStyle: TextStyle(
            wordSpacing: 0.0,
            //单词间隙(负值可以让单词更紧凑)
            letterSpacing: 0.0,
            //字母间隙(负值可以让字母更紧凑)
            fontStyle: FontStyle.normal,
            //文字样式，斜体和正常
            fontSize: 15.0,
            //字体大小
            fontWeight: FontWeight.w900,
            //字体粗细  粗体和正常
            color: Colors.black, //文字颜色
          ),
          isVisible: true,
          position: LegendPosition.top,
//                    title: LegendTitle(text: "aaa",),
        ),
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: model.getMaxValue().toDouble(),
          isVisible: false,
          labelFormat: '{value}',
        ),
        series: _getCategory(chartData: model.chartData),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          header: '',
          canShowMarker: false,
        ),
    );
  }

  List<ColumnSeries<EachDayData, String>> _getCategory(
      {List<EachDayData> chartData}) {
    chartData = chartData.reversed.toList();
    return <ColumnSeries<EachDayData, String>>[
      ColumnSeries<EachDayData, String>(
        color: Colors.red,

        ///dataSource为数据list
        dataSource: chartData,
        xValueMapper: (EachDayData data, _) => data.xDate,
        yValueMapper: (EachDayData data, _) => data.yValue1,
//        pointColorMapper: (EachDayData data, _) => data.pointColor,
        pointColorMapper: (EachDayData data, _) => Colors.red,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        name: '采集量',
      ),
      ColumnSeries<EachDayData, String>(
        color: Colors.green,

        ///dataSource为数据list
        dataSource: chartData,
        xValueMapper: (EachDayData data, _) => data.xDate,
        yValueMapper: (EachDayData data, _) => data.yValue2,
//        pointColorMapper: (EachDayData data, _) => data.pointColor,
        pointColorMapper: (EachDayData data, _) => Colors.green,
        dataLabelSettings: DataLabelSettings(isVisible: true),
        name: '相关量',
      )
    ];
  }
}
