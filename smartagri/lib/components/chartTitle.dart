import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartagri/data/chartData.dart';


class ChartTitle{
  static lineTouchData1() => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  static gridData() => FlGridData(
    show:  false,
    getDrawingHorizontalLine: (value) {
      return FlLine(
        color: Colors.black,
        strokeWidth: 1,
      );
    },
    getDrawingVerticalLine:  (value) {
      return FlLine(
        color: Color.fromARGB(255, 39, 38, 43),
        strokeWidth: 1,
      );
    },
  );

  static borderData() => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Color(0xff4e4965), width: 4),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );


  static titlesData1(List<chartData> data) => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        getTitlesWidget: (double value, TitleMeta meta) {
          // value = da
          const style = TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          );
          Widget text;
          switch (value.toInt()) {
            case 1:
              text = Text(data[data.length-11].time!.toString(), style: style);
              break;
            case 2:
              text = const Text('OCT', style: style);
              break;
            case 3:
              text = const Text('DEC', style: style);
              break;
            case 4:
              text = const Text('SEPT', style: style);
              break;
            case 5:
              text = const Text('OCT', style: style);
              break;
            case 6:
              text = const Text('DEC', style: style);
              break;
            case 7:
              text = const Text('SEPT', style: style);
              break;
            case 8:
              text = const Text('OCT', style: style);
              break;
            case 9:
              text = const Text('DEC', style: style);
              break;
            case 10:
              text = const Text('SEPT', style: style);
              break;
            case 11:
              text = const Text('OCT', style: style);
              break;
            case 12:
              text = const Text('DEC', style: style);
              break;
            default:
              text = const Text('');
              break;
          }

          return SideTitleWidget(
            axisSide: meta.axisSide,
            space: 10,
            child: text,
          );
        },
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      ),
    ),
    rightTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        getTitlesWidget: (double value, TitleMeta meta) {
          const style = TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
          String text;
          switch (value.toInt()) {
            case 1:
              text = '1m';
              break;
            case 2:
              text = '2m';
              break;
            case 3:
              text = '3m';
              break;
            case 4:
              text = '5m';
              break;
            case 5:
              text = '6m';
              break;
            default:
              return Container();
          }

          return Text(text, style: style, textAlign: TextAlign.center);
        },
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      ),
    ),
  );
  //
  // static lineBarsData1(List<chartData> data) => [
  //   LineChartBarData(
  //     isCurved: true,
  //     color: const Color(0xff4af699),
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(show: false),
  //     belowBarData: BarAreaData(show: false),
  //     spots: const [
  //       FlSpot(1, 1),
  //       FlSpot(3, 1.5),
  //       FlSpot(5, 1.4),
  //       FlSpot(7, 3.4),
  //       FlSpot(10, 2),
  //       FlSpot(12, 2.2),
  //       FlSpot(13, 1.8),
  //     ],
  //   ),
  //   LineChartBarData(
  //     isCurved: true,
  //     color: const Color(0xffaa4cfc),
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(show: false),
  //     belowBarData: BarAreaData(
  //       show: false,
  //       color: const Color(0x00aa4cfc),
  //     ),
  //     spots: const [
  //       FlSpot(1, 1),
  //       FlSpot(3, 2.8),
  //       FlSpot(7, 1.2),
  //       FlSpot(10, 2.8),
  //       FlSpot(12, 2.6),
  //       FlSpot(13, 3.9),
  //     ],
  //   ),
  //   LineChartBarData(
  //     isCurved: true,
  //     color: const Color(0xff27b6fc),
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(show: false),
  //     belowBarData: BarAreaData(show: false),
  //     spots: const [
  //       FlSpot(1, 2.8),
  //       FlSpot(3, 1.9),
  //       FlSpot(6, 3),
  //       FlSpot(10, 1.3),
  //       FlSpot(13, 2.5),
  //     ],
  //   ),
  // ];


}