import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:testfun_project/function/Charts/color_extensions.dart';
import 'package:testfun_project/function/Charts/resources/app_resources.dart';

class _LineChart extends StatelessWidget {
  _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  static List<int> showingTooltipOnSpots = [1,2,3,4,5,6];

  static List<FlSpot> get allSpots => const [
    FlSpot(1, 1),
    FlSpot(3, 2.8),
    FlSpot(7, 1.2),
    FlSpot(10, 2.8),
    FlSpot(12, 2.6),
    FlSpot(13, 3.9),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    titlesData: titlesData,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    backgroundColor: Colors.white,
    minX: 0,
    minY: 0,
    maxX: 14,
    maxY: 10,
  );

  LineChartData get sampleData2 => LineChartData(
    showingTooltipIndicators: showingTooltipOnSpots.map((index) {
      return ShowingTooltipIndicators([
        LineBarSpot(
          lineChartBarData2,
          lineBarsData2.indexOf(lineChartBarData2),
          lineChartBarData2.spots[index-1],
        ),
      ]);
    }).toList(),
    lineTouchData: lineTouchData2,
    titlesData: titlesData,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    backgroundColor: Colors.white,
    minX: 0,
    minY: 0,
    maxX: 14,
    maxY: 10,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    enabled: true,
    touchTooltipData: LineTouchTooltipData( // touch spot tooltip
      getTooltipColor: (touchedSpot) => Colors.transparent,
      tooltipBorder: const BorderSide(color: Colors.transparent),
      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
        return lineBarsSpot.map((lineBarSpot) {
          print('bar color ${lineBarSpot.bar.color}');
          var color = lineBarSpot.bar.color;
          return LineTooltipItem(
            lineBarSpot.y.toString(),
            TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          );
        }).toList();
      },
      tooltipPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      tooltipMargin: 10,
      maxContentWidth: 220,
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
  ];

  LineTouchData get lineTouchData2 => LineTouchData(
    getTouchedSpotIndicator: (barData, spotIndexes) {
      return spotIndexes.map((spotIndex) {
        return const TouchedSpotIndicatorData(
          FlLine(
            strokeWidth: 0,
          ),
          FlDotData(show: false),
        );
      }).toList();
    },
    enabled: false,
    touchCallback: // touch spot event
        (FlTouchEvent event, LineTouchResponse? response) {
      if (response == null || response.lineBarSpots == null) {
        return;
      }
      if (event is FlTapUpEvent) {
        final spotIndex = response.lineBarSpots!.first.spotIndex;
        print(spotIndex);
      }
    },
    touchTooltipData: LineTouchTooltipData( // touch spot tooltip
      getTooltipColor: (touchedSpot) => Colors.transparent,
      tooltipBorder: const BorderSide(color: Colors.transparent),
      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
        return lineBarsSpot.map((lineBarSpot) {
          return LineTooltipItem(
            lineBarSpot.y.toString(),
            const TextStyle(
              fontSize: 14,
              color: AppColors.contentColorBlack,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          );
        }).toList();
      },
      tooltipPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      tooltipMargin: 10,
      maxContentWidth: 220,
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
      color: Colors.white,
      fontSize: 10,
    );
    String text;
    text = "${value.toInt()}m";

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: Colors.white,
      decoration: TextDecoration.none,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('H0001', style: style);
        break;
      case 3:
        text = const Text('24.03.03', style: style);
        break;
      case 7:
        text = const Text('24.07.07', style: style);
        break;
      case 12:
        text = const Text('24.12.12', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Colors.amberAccent),
      left: BorderSide(color: Colors.amberAccent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: false,
    color: AppColors.contentColorGreen,
    barWidth: 2,
    curveSmoothness: 0,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: AppColors.contentColorPink,
    barWidth: 2,
    curveSmoothness: 0,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: false,
    curveSmoothness: 0,
    color: AppColors.contentColorCyan,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(13, 2.5),
    ],
  );

  static LineChartBarData get lineChartBarData2 => LineChartBarData(
    isCurved: false,
    showingIndicators: showingTooltipOnSpots,
    spots: allSpots,
    color: AppColors.contentColorBlue.withOpacity(0.5),
    barWidth: 3,
    isStrokeCapRound: false,
    dotData: const FlDotData(show: true),
  );

}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 37,
          ),
          const Text(
            'Chart Test',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 6),
              child: _LineChart(isShowingMainData: isShowingMainData),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
            ),
            onPressed: () {
              setState(() {
                isShowingMainData = !isShowingMainData;
              });
            },
          )
        ],
      ),
    );
  }
}