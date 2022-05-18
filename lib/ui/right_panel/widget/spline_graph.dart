import 'package:flutter/material.dart';
import '../../../widgets/charts/charts_widget/charts.dart';

class SplineGraph extends StatefulWidget {
  const SplineGraph({Key? key}) : super(key: key);

  @override
  _SplineGraphState createState() => _SplineGraphState();
}

class _SplineGraphState extends State<SplineGraph> {
  TooltipBehavior? _tooltipBehavior;
  SplineType? _spline;

  @override
  void initState() {
    _spline = SplineType.natural;
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      header: '',
      canShowMarker: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return SfCartesianChart(
        backgroundColor: Colors.transparent,
        onTooltipRender: (TooltipArgs args) {
          args.text = 'expense\n\$2,250.00';
        },
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          minimum: DateTime.january.toDouble(),
          maximum: DateTime.june.toDouble(),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),
        ),
        primaryYAxis: NumericAxis(
          labelFormat: '{value}k',
          minimum: 0,
          maximum: 15.0,
          interval: 5.0,
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0),
          axisLine: const AxisLine(width: 0),
        ),
        series: _getSplineTypesSeries(),
        tooltipBehavior: _tooltipBehavior,
      );
    });
  }

  List<SplineSeries<_ChartData, String>> _getSplineTypesSeries() {
    final chartData = <_ChartData>[
      _ChartData('dummy', 6.05),
      _ChartData('Jan', 5.0),
      _ChartData('Feb', 10.0),
      _ChartData('Mar', 6.04),
      _ChartData('Apr', 3.04),
      _ChartData('May', 8.09),
      _ChartData('Jun', 3.09),
    ];
    return <SplineSeries<_ChartData, String>>[
      SplineSeries<_ChartData, String>(
        splineType: _spline,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.y,
      )
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
