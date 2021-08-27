
import 'package:flutter/material.dart';

import '../../../widgets/charts/charts_widget/charts.dart';

class DoughnutGraph extends StatefulWidget {
  const DoughnutGraph({Key? key}) : super(key: key);

  @override
  _DoughnutGraphState createState() => _DoughnutGraphState();
}

class _DoughnutGraphState extends State<DoughnutGraph> {
  String outerRadius = '120.0';
  String innerRadius = '90.0';

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        width: 355.0,
        height: 290.0,
        child: SfCircularChart(
          series: _getDoughnutSeries(),
        ),
      ),
    );
  }

  List<DoughnutSeries<DoughnutChartData, String>> _getDoughnutSeries() {
    final chartData = <DoughnutChartData>[
      DoughnutChartData(content: 'test1', value: 5),
      DoughnutChartData(content: 'test3', value: 3),
      DoughnutChartData(content: 'test2', value: 4),
      DoughnutChartData(content: 'test4', value: 7),
    ];
    return <DoughnutSeries<DoughnutChartData, String>>[
      DoughnutSeries<DoughnutChartData, String>(
        radius: outerRadius,
        innerRadius: innerRadius,
        cornerStyle: CornerStyle.bothCurve,

        /// To set the spline type here.
        dataSource: chartData,
        xValueMapper: (DoughnutChartData sales, _) => sales.content,
        yValueMapper: (DoughnutChartData sales, _) => sales.value,
        //dataLabelSettings: DataLabelSettings(isVisible: true),
      )
    ];
  }
}

class DoughnutChartData {
  DoughnutChartData({this.content, this.value});

  final String? content;
  final int? value;
}
