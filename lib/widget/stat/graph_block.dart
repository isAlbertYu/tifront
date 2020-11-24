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
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
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
                return SfCartesianChart(
                  title: ChartTitle(text: 'Internet Users - 2016'),
                  plotAreaBorderWidth: 0,

                  /// X axis as category axis placed here.
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 80,
                      isVisible: false,
                      labelFormat: '{value}M'),
                  series: _getCategory(chartData: model.chartData),
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    header: '',
                    canShowMarker: false,
                  ),
                );
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
  List<ColumnSeries<EachDayData, String>> _getCategory(
      {List<EachDayData> chartData}) {
    return <ColumnSeries<EachDayData, String>>[
      ColumnSeries<EachDayData, String>(
        ///dataSource为数据list
        dataSource: chartData,
        xValueMapper: (EachDayData data, _) => data.xDate,
        yValueMapper: (EachDayData data, _) => data.yValue,
//        pointColorMapper: (EachDayData data, _) => data.pointColor,
        pointColorMapper: (EachDayData data, _) => Colors.pink[200],
        dataLabelSettings: DataLabelSettings(isVisible: true),
      )
    ];
  }
}
