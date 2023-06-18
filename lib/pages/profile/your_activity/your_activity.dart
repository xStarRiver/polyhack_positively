import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class YourActivity extends StatelessWidget {
  const YourActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Sun', 1),
      ChartData('Mon', 2.5),
      ChartData('Tue', 1.5),
      ChartData('Wed', 2),
      ChartData('Thu', 0.1),
      ChartData('Fri', 0.3),
      ChartData('Sat', .7),
    ];
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          Text('Time on Social Media', style: blackSemiBold18),
          heightSpace20,
          Column(
            children: [
              Text('1h 20min', style: primaryBold20),
              Text('Daily Average', style: color94SemiBold16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit Suspendisse est integer semper justo ut ultrices Tristique urna in ultrices.',
                style: color94Regular14,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                  labelStyle: colorB7Regular16,
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0)),
              primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
              ),
              series: [
                ColumnSeries(
                    dataSource: chartData,
                    color: primaryColor,
                    dataLabelMapper: (datum, index) => index == 6 ? '50m' : '',
                    dataLabelSettings: DataLabelSettings(
                        isVisible: true, textStyle: blackSemiBold14),
                    spacing: -0.325,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ))
              ])
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(
        title: 'Your Activity',
      ),
    );
  }
}
