import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import 'package:smartagri/data/chartData.dart';

import '../data/datasetField.dart';
import '../helper/ChangeFloatToDate.dart';
import 'chartTitle.dart';

class ChartHomePage extends StatefulWidget {
  List <chartData> data;
  List dataY;
  int index;
  ChartHomePage({ Key? key, required this.data, required this.dataY, required this.index }) : super(key: key);

  @override
  State<ChartHomePage> createState() => _ChartHomePageState(data,dataY,index);
}

class _ChartHomePageState extends State<ChartHomePage> {

  final List <chartData> data;
  final List dataY;
  final int index;
  _ChartHomePageState(this.data,this.dataY, this.index);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Container(
          color: Colors.white,
          width: 500,
          height: 500,
          child: LineChart(
              LineChartData(
                lineTouchData: ChartTitle.lineTouchData1(),
                gridData: ChartTitle.gridData(),
                titlesData: FlTitlesData(
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
                            text = Text('${Changes().getTime(
                                data[data.length - 12].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 2:
                            text = Text('${Changes().getTime(
                                data[data.length - 11].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 3:
                            text = Text('${Changes().getTime(
                                data[data.length - 10].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 4:
                            text = Text('${Changes().getTime(
                                data[data.length - 9].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 5:
                            text = Text('${Changes().getTime(
                                data[data.length - 8].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 6:
                            text = Text('${Changes().getTime(
                                data[data.length - 7].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 7:
                            text = Text('${Changes().getTime(
                                data[data.length - 6].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 8:
                            text = Text('${Changes().getTime(
                                data[data.length - 5].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 9:
                            text = Text('${Changes().getTime(
                                data[data.length - 4].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 10:
                            text = Text('${Changes().getTime(
                                data[data.length - 3].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 11:
                            text = Text('${Changes().getTime(
                                data[data.length - 2].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          case 12:
                            text = Text('${Changes().getTime(
                                data[data.length - 1].time!.toString())}',
                              style: TextStyle(fontSize: 16,),);
                            break;
                          default:
                            text = const Text('');
                            break;
                        }

                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 10,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(-45 / 360),
                            child: text,
                          ),
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
                        //--------------max---------------------
                        if (value.toInt() == dataY[0]) text = dataY[0].toString();
                        //-------------min --------------------
                        else if (value.toInt() == dataY[1]) text = dataY[1].toString();
                        // ------------------Mức 1----------------------------
                        else if(value.toInt() == (dataY[1]+(dataY[0]-dataY[1])~/3).toInt()) text = (dataY[1]+(dataY[0]-dataY[1])~/3).toString();
                        // -------------------Mức 2---------------------------
                        else if(value.toInt() == (dataY[1]+(dataY[0]-dataY[1])~/3*2).toInt()) text = (dataY[0]-(dataY[0]-dataY[1])~/3).toString();

                        //------------DEFAULT---------------------------
                        else text = "";
                        //=====================END IF =========================
                        return Text(
                            text, style: style, textAlign: TextAlign.center);
                      },
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                ),

                borderData: ChartTitle.borderData(),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: false,
                    color: Colors.red,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    // dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                    spots: [
                      FlSpot(1, data[data.length - 12].n1!.toDouble()),
                      FlSpot(2, data[data.length - 11].n1!.toDouble()),
                      FlSpot(3, data[data.length - 10].n1!.toDouble()),
                      FlSpot(4, data[data.length - 9].n1!.toDouble()),
                      FlSpot(5, data[data.length - 8].n1!.toDouble()),
                      FlSpot(6, data[data.length - 7].n1!.toDouble()),
                      FlSpot(7, data[data.length - 6].n1!.toDouble()),
                      FlSpot(8, data[data.length - 5].n1!.toDouble()),
                      FlSpot(9, data[data.length - 4].n1!.toDouble()),
                      FlSpot(10,data[data.length - 3].n1!.toDouble()),
                      FlSpot(11,data[data.length - 2].n1!.toDouble()),
                      FlSpot(12,data[data.length - 1].n1!.toDouble()),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: false,
                    color: Colors.blue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: false,
                      color: const Color(0x00aa4cfc),
                    ),
                    spots: [
                      FlSpot(1, data[data.length - 12].n2!.toDouble()),
                      FlSpot(2, data[data.length - 11].n2!.toDouble()),
                      FlSpot(3, data[data.length - 10].n2!.toDouble()),
                      FlSpot(4, data[data.length - 9].n2!.toDouble()),
                      FlSpot(4, data[data.length - 9].n2!.toDouble()),
                      FlSpot(5, data[data.length - 8].n2!.toDouble()),
                      FlSpot(6, data[data.length - 7].n2!.toDouble()),
                      FlSpot(7, data[data.length - 6].n2!.toDouble()),
                      FlSpot(8, data[data.length - 5].n2!.toDouble()),
                      FlSpot(9, data[data.length - 4].n2!.toDouble()),
                      FlSpot(10, data[data.length - 3].n2!.toDouble()),
                      FlSpot(11, data[data.length - 2].n2!.toDouble()),
                      FlSpot(12, data[data.length - 1].n2!.toDouble()),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: false,
                    color: Colors.green,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                    spots:
                    [
                      FlSpot(1, data[data.length - 12].n3!.toDouble()),
                      FlSpot(2, data[data.length - 11].n3!.toDouble()),
                      FlSpot(3, data[data.length - 10].n3!.toDouble()),
                      FlSpot(4, data[data.length - 9].n3!.toDouble()),
                      FlSpot(4, data[data.length - 9].n3!.toDouble()),
                      FlSpot(5, data[data.length - 8].n3!.toDouble()),
                      FlSpot(6, data[data.length - 7].n3!.toDouble()),
                      FlSpot(7, data[data.length - 6].n3!.toDouble()),
                      FlSpot(8, data[data.length - 5].n3!.toDouble()),
                      FlSpot(9, data[data.length - 4].n3!.toDouble()),
                      FlSpot(10, data[data.length - 3].n3!.toDouble()),
                      FlSpot(11, data[data.length - 2].n3!.toDouble()),
                      FlSpot(12, data[data.length - 1].n3!.toDouble()),
                    ],
                  ),
                ],
                minX: 0,
                maxX: 13,
                maxY: double.parse(dataY[0].toString()),
                minY: double.parse(dataY[1].toString()),
              )
          )
      );

}