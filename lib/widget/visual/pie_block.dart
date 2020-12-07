import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tifront/util/screen_util.dart';
import 'package:tifront/widget/stat/models/graph_block_rfr_btn_model.dart';
import 'package:tifront/widget/visual/models/pie_data.dart';

class PieBlock extends StatelessWidget {
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
      child: PieCell(),
    );
  }
}

class PieCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GraphBlockRfrBtnModel>(
      ///参数 model 就是绑定的事件结果 ArticleListModel
      builder: (BuildContext context, GraphBlockRfrBtnModel _, Widget child) {
        PieDataModel model = PieDataModel();
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
                return PieChart(model: model);
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
}

class PieChart extends StatelessWidget {
  final PieDataModel model;

  PieChart({this.model});

  @override
  Widget build(BuildContext context) {
    ScreenUtil scUtil = ScreenUtil.getInstance();
    scUtil.init(context);
    return SfCircularChart(
      title: ChartTitle(
        text: '来源网站分布',
        textStyle: TextStyle(
          wordSpacing: 0.0,
          //单词间隙(负值可以让单词更紧凑)
          letterSpacing: 0.0,
          //字母间隙(负值可以让字母更紧凑)
          fontStyle: FontStyle.normal,
          //文字样式，斜体和正常
          fontSize: scUtil.setSp(12),
          //字体大小
          fontWeight: FontWeight.w900,
          //字体粗细  粗体和正常
          color: Colors.white70, //文字颜色
        ),
      ),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: _getPieSeries(pieData: model.pieData),

      /// To enabe the tooltip and its behaviour.
      tooltipBehavior: TooltipBehavior(
        enable: true,
//          tooltipPosition: TooltipPosition.pointer,
//          duration: (duration ?? 2.0) * 1000,
      ),
    );
  }
}

List<PieSeries<EachItemData, String>> _getPieSeries(
    {List<EachItemData> pieData}) {
  return <PieSeries<EachItemData, String>>[
    PieSeries<EachItemData, String>(
        dataSource: pieData,
        xValueMapper: (EachItemData data, _) => data.xWebsite,
        yValueMapper: (EachItemData data, _) => data.yValue,
        dataLabelMapper: (EachItemData data, _) => data.xWebsite,
//        radius: '60%',

        /// By using this property we can enable the smart label mode.
        enableSmartLabels: false,
        dataLabelSettings: DataLabelSettings(
            isVisible: false,
            showZeroValue: true,
            labelPosition: ChartDataLabelPosition.outside,
            connectorLineSettings:
                ConnectorLineSettings(type: ConnectorType.curve)))
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
