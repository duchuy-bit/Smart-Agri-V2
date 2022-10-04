import 'package:flutter/material.dart';

import '../components/chartHome.dart';
import '../data/chartData.dart';
import '../data/datasetField.dart';

class ChartScreen extends StatefulWidget {
  List <DataSet> dataHome;
  ChartScreen({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState(dataHome);
}

class _ChartScreenState extends State<ChartScreen> {

  final List <DataSet> dataHome;
  _ChartScreenState(this.dataHome);

  int indexMenu=1;

  List <chartData> dataChart =[
      chartData('0', '0', 1, 2, 3)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      dataChart.removeRange(0, dataChart.length);
      for (int i=0;i<12;i++){
        var t1 = double.parse(dataHome[i].temperature1.toString())/10;
        var t2 = double.parse(dataHome[i].temperature2.toString())/10;
        var t3 = double.parse(dataHome[i].temperature3.toString())/10;

        var tam =
        chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
        dataChart.add(tam);
      };

      // for (int i=0;i<12;i++){
      //   print("${dataChart[i].date}  ${dataChart[i].time}");
      // }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple[100] ,
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffe1bee7),
                Color(0xfff3e5f5),
                Color(0xffFFFFFF)
              ]
          )
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Pannel(),
              Menu(),
            ],
          ),

          //-------------------- trang thai cong tac, nguong thiet lap, gia tri hien tai--------------
          ThreeDetail(),

          Container(
              width: MediaQuery.of(context).size.width-50,
              height: 300,
              child: ChartHomePage(data: dataChart,)),

        ],
      ),
    );
  }

  Widget Detail(int n)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width /2,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        children: [
          Text('')
        ],
      ),
    ),
  );

  Widget ThreeDetail()=>Padding(
    padding: const EdgeInsets.only(left: 10,top: 30,right: 10),
    child: Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Detail(1),
            Detail(2),
            Detail(3),
          ],

        ),
      ),
    ),
  );

  Widget Menu()=>Padding(
    padding: const EdgeInsets.only(top:60),
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 3/4 ,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //----------Menu Nhiệt Độ----------
            GestureDetector(
              onTap: (){
                setState(() {
                  indexMenu=1;

                  dataChart.removeRange(0, dataChart.length);
                  for (int i=0;i<12;i++){
                    var t1 = double.parse(dataHome[i].temperature1.toString())/10;
                    var t2 = double.parse(dataHome[i].temperature2.toString())/10;
                    var t3 = double.parse(dataHome[i].temperature3.toString())/10;

                    var tam =chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
                    dataChart.add(tam);
                  };
                  for (int i=0;i<12;i++){
                    print("${dataChart[i].date}  ${dataChart[i].time} ${dataChart[i].n1} ${dataChart[i].n2} ${dataChart[i].n3}");
                  }
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: indexMenu == 1 ? Colors.red : Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: indexMenu ==1 ?  Text(' Nhiệt độ ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),)
                        :Text('Nhiệt độ',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.normal),),
                  )
              ),
            ),

            //----------Menu Độ ẩm----------
            GestureDetector(
              onTap: (){
                setState(() {
                  indexMenu=2;
                  dataChart.removeRange(0, dataChart.length);
                  for (int i=0;i<12;i++){
                    var t1 = double.parse(dataHome[i].humidity1.toString())/10;
                    var t2 = double.parse(dataHome[i].humidity2.toString())/10;
                    var t3 = double.parse(dataHome[i].humidity3.toString())/10;

                    var tam =
                    chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
                    dataChart.add(tam);
                  };

                  for (int i=0;i<12;i++){
                    print("${dataChart[i].date}  ${dataChart[i].time} ${dataChart[i].n1} ${dataChart[i].n2} ${dataChart[i].n3}");
                  }
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: indexMenu == 2 ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: indexMenu ==2 ?  Text(' Độ ẩm ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),)
                        :Text('Độ ẩm',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.normal),),
                  )
              ),
            ),

            //----------Menu Ánh sáng----------
            GestureDetector(
              onTap: (){
                setState(() {
                  indexMenu=3;
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: indexMenu == 3 ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: indexMenu ==3 ?  Text(' Ánh sáng ',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),)
                        :Text('Ánh sáng',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.normal),),
                  )
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget Pannel()=>Container(
    width: MediaQuery.of(context).size.width,
    // height: 50,
    decoration: const BoxDecoration(
        color: Color(0xff6849ef) ,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0)
        ),
        gradient: LinearGradient(
            colors: [
              Color(0xff6849ef),
              Color(0xff886ff2),

              // Color(0xffFFFFFF),
            ]
        )
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 20,bottom: 35),
      child: Center(
        child: Text('Thông số trong 12h gần nhất',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
      ),
    ),
  );
}
