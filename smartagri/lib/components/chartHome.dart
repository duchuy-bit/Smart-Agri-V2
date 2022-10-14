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
    // setDefaultMINMAXY();

    for (int i=0;i<12;i++){
      print("- ${data[i].date} ${data[i].time} ${data[i].n1} ${data[i].n2} ${data[i].n3}");
    }

    // print(double.parse(((double.parse(dataY[0].toString()).toInt())~/10 ).toString()));
    // print(double.parse(((double.parse(dataY[0].toString()).toInt())~/10 *10 +10 ).toString()));
    //
    // print(double.parse(((double.parse(dataY[1].toString()).toInt())~/10 ).toString()));
    // print(double.parse(((double.parse(dataY[1].toString()).toInt())~/10 *10 ).toString()));

    print("index = $index");
    print(double.parse(((double.parse(dataY[0].toString()).toInt())~/(10) *10 +10 ).toString()));

    int somu=1;
    for (int i=0;i< dataY[0].toInt().toString().length-1 ;i++) somu=somu*10;
    print((dataY[0].toString().length-1));
    print(somu);

    print(double.parse((((double.parse(dataY[0].toString()).toInt())~/(somu)+1)*somu ).toString()));
    print(double.parse((((double.parse(dataY[1].toString()).toInt())~/(somu)+1)*somu ).toString()));
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
                        switch (value.toInt()) {
                          case 0:
                            text = '0';
                            break;
                          case 10:
                            dataY[2] == 3 ? text ='': text = '10';
                            break;
                          case 20:
                            dataY[2] == 3? text ="": text = '20';
                            break;
                          case 22:      //--temperature
                            dataY[2] ==1 ? text = '22': text ="";
                            break;
                          case 24: //--temperature
                            dataY[2] ==1 ? text = '24': text ="";
                            break;
                          case 26: //--temperature
                            dataY[2] ==1 ?  text = '26': text = "";
                            break;
                          case 28: //--temperature
                            dataY[2] ==1 ? text = '28': text = "";
                            break;
                          case 30:
                            dataY[2] == 3? text ="30": text = '30';
                            break;
                          case 32: //--temperature
                            dataY[2] ==1 ? text = '32': text ="";
                            break;
                          case 34:
                            dataY[2] ==1 ?  text = '34': text ="";
                            break;
                          case 36: //--temperature
                            dataY[2] ==1 ?  text = '36': text ="";
                            break;
                          case 38: //--temperature
                            dataY[2] ==1 ? text = '38': text="";
                            break;
                          case 40:
                            dataY[2] == 3? text ="": text = '40';
                            break;
                          case 50:
                            dataY[2] == 3? text ="": text = '50';
                            break;
                          case 60:
                            dataY[2] == 3? text ="": text = '60';
                            break;
                          case 70:
                            dataY[2] == 3? text ="": text = '70';
                            break;
                          case 80:
                            dataY[2] == 3? text ="": text = '80';
                            break;
                          case 90:
                            dataY[2] == 3? text ="": text = '90';
                            break;
                          case 100:
                            dataY[2] == 3? text ="100": text = '100';
                            break;
                          case 200:
                            text = "200";
                            break;
                          case 300:
                            text = "300";
                            break;
                          case 400:
                            text = "400";
                            break;
                          case 500:
                            text = "500";
                            break;
                          case 600:
                            text = "600";
                            break;
                          case 1000:
                            text = "1k";
                            break;
                          case 2000:
                            text = "2k";
                            break;
                          case 3000:
                            text = "3k";
                            break;
                          case 4000:
                            text = "4k";
                            break;
                          case 5000:
                            text = "5k";
                            break;
                          case 6000:
                            text = "6k";
                            break;
                          case 7000:
                            text = "7k";
                            break;
                          case 8000:
                            text = "8k";
                            break;
                          case 9000:
                            text = "9k";
                            break;
                          case 10000:
                            text = "10k";
                            break;
                          default:
                            return Container();
                        }
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
                maxY: double.parse(((double.parse(dataY[0].toString()).toInt())~/10 *10 +10 ).toString()),
                minY: double.parse(((double.parse(dataY[1].toString()).toInt())~/10 *10 ).toString()),
              )
          )
      );

}