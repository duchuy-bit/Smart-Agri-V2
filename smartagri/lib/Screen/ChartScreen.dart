import 'package:flutter/material.dart';
import 'dart:math';
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

  List dataY =[0.0 , 0.0, 1];
  int index=2;

  List dataSlider = [];

  setDefaultMINMAXY(){
    setState(() {
      double maxy=0;
      double miny =0;

      double m1,m2,m3,min1,min2,min3;
      List<double> tam = [];

      //---------max khu vuc 1-----------
      for (int i=0;i<12;i++ ){
        tam.add(double.parse(dataChart[i].n1.toString()));
      }
      m1 = double.parse(tam.reduce(max).toString());
      min1 = double.parse(tam.reduce(min).toString());
      print("maxy = $m1, min = $min1");

      //----------max khu vuc 2----------
      tam.removeRange(0, tam.length);
      for (int i=0;i<12;i++ ){
        tam.add(double.parse(dataChart[i].n2.toString()));
      }
      m2 = double.parse(tam.reduce(max).toString());
      min2 = double.parse(tam.reduce(min).toString());
      print("maxy = $m2, min = $min2");

      //---------max khu vuc 3--------------
      tam.removeRange(0, tam.length);
      for (int i=0;i<12;i++ ){
        tam.add(double.parse(dataChart[i].n3.toString()));
      }
      m3 = double.parse(tam.reduce(max).toString());
      min3 = double.parse(tam.reduce(min).toString());

      print("maxy = $m3, min = $min3");

      maxy= m1;
      if (maxy < m2) maxy =m2;
      if (maxy < m3) maxy = m3;

      miny=min1;
      if(miny > min2) miny = min2;
      if(miny > min3) miny = min3;

      dataY.removeRange(0, 3);
      dataY.add(maxy);
      dataY.add(miny);
      dataY.add(indexMenu);
      print("max arr = ${dataY[0]} ---  ${dataY[1]}");

      //Add data to dataSlider
      dataSlider.removeRange(0, dataSlider.length);
      if (indexMenu ==1)
        {
          double t1 = double.parse(dataHome[0].temperature1.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].temperature2.toString())/10;        dataSlider.add(t1);
          t1 = double.parse(dataHome[0].temperature3.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A1_MIN.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A2_MIN.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A3_MIN.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A1_MAX.toString())/10;       dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A2_MAX.toString())/10;    dataSlider.add(t1);
          t1 = double.parse(dataHome[0].ND_A3_MAX.toString())/10;      dataSlider.add(t1);
        }
      else
      if (indexMenu ==2)
      {
        double t1 = double.parse(dataHome[0].humidity1.toString())/10;
        dataSlider.add(t1);
        t1 = double.parse(dataHome[0].humidity2.toString())/10;
        dataSlider.add(t1);
        t1 = double.parse(dataHome[0].humidity3.toString())/10;
        dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A1_MIN.toString())/10;       dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A2_MIN.toString())/10;       dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A3_MIN.toString())/10;       dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A1_MAX.toString())/10;       dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A2_MAX.toString())/10;    dataSlider.add(t1);
        t1 = double.parse(dataHome[0].DA_A3_MAX.toString())/10;      dataSlider.add(t1);
      }
      else
      {
        dataSlider.add(dataHome[0].light1); dataSlider.add(dataHome[0].light2); dataSlider.add(dataHome[0].light3);
        dataSlider.add(dataHome[0].AS_A1_MIN); dataSlider.add(dataHome[0].AS_A2_MIN); dataSlider.add(dataHome[0].AS_A3_MIN);
        dataSlider.add(dataHome[0].AS_A1_MAX); dataSlider.add(dataHome[0].AS_A2_MAX); dataSlider.add(dataHome[0].AS_A3_MAX);
      }
      print('Data Slider: ');
      dataSlider.forEach((element) {
        print("$element   ");
      });
      // dataSlider.add(value)

      print('set if');
      print('data ${dataSlider[2]}');
      print((dataSlider[2]> dataSlider[8]) && (dataSlider[2]< dataSlider[5]));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      dataChart.removeRange(0, dataChart.length);
      for (int i=11;i>=0;i--){
        var t1 = double.parse(dataHome[i].temperature1.toString())/10;
        var t2 = double.parse(dataHome[i].temperature2.toString())/10;
        var t3 = double.parse(dataHome[i].temperature3.toString())/10;

        var tam =
        chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
        dataChart.add(tam);
        // dataChart.add(1.0);
      }
      setDefaultMINMAXY();

      // for (int i=0;i<12;i++){
      //   print("${dataChart[i].date}  ${dataChart[i].time}");
      // }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            // ThreeDetail(),
            SliderValue(),

            //------------------CHART_---------------------------
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 3  ,left: 8,right: 8,bottom: 16),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Biểu đồ giá trị  ',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              indexMenu ==1?
                              Text('Nhiệt Độ',style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold))
                                  : indexMenu == 2? Text('Độ Ẩm',style: TextStyle(fontSize: 18,color: Colors.blue,fontWeight: FontWeight.bold))
                              : Text('Ánh Sáng',style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: MediaQuery.of(context).size.width-30,
                          child: ChartHomePage(data: dataChart,dataY: dataY,index: index,)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.linear_scale_outlined,size: 40,color: Colors.red,),
                                Text(' KV1',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.linear_scale_outlined,size: 40,color: Colors.blue,),
                                Text(' KV2',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.linear_scale_outlined,size: 40,color: Colors.green,),
                                Text(' KV3',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // ThreeDetail(),
          ],
        ),
      ),
    );
  }

  Widget SliderValue()=>SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 15),
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ---------------SLIDER 1-----------------------------
              Container(
                width: MediaQuery.of(context).size.width/3,
                // height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,bottom: 8),
                        child: Text("Hiện tại",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("KV1: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          Text(dataSlider[0].toString()),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("KV2: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          Text(dataSlider[1].toString()),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("KV3: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                          Text(dataSlider[2].toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // ---------------SLIDER 2-----------------------------
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  // height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:15,bottom: 8),
                          child: Text("Công tắc",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("KV1: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            (dataSlider[0]> dataSlider[6]) || (dataSlider[0]< dataSlider[3])? Text(' ON'): Text('OFF'),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("KV2: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            (dataSlider[1]> dataSlider[7]) || (dataSlider[1]< dataSlider[4])? Text(' ON'): Text('OFF'),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("KV3: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                            (dataSlider[2]> dataSlider[8]) || (dataSlider[2]< dataSlider[5])? Text(' ON'): Text('OFF'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // ---------------SLIDER 3-----------------------------
              Container(
                // width: MediaQuery.of(context).size.width*2/3,
                // height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,bottom: 8),
                        child: Text("Thiết lập",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //----------Thiết Lập MIN----------------
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('KV1-MIN: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  Text(dataSlider[3].toString())
                                ],
                              ),
                              Row(
                                children: [
                                  Text('KV2-MIN: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  Text(dataSlider[4].toString())
                                ],
                              ),
                              Row(
                                children: [
                                  Text('KV3-MIN: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  Text(dataSlider[5].toString())
                                ],
                              )
                            ],
                          ),
                          //-------------THIẾT LẬP MAX-----------
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('KV1-MAX: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    Text(dataSlider[6].toString())
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('KV2-MAX: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    Text(dataSlider[7].toString())
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('KV3-MAX: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                    Text(dataSlider[8].toString())
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    ),
  );

  // Widget Detail(int n)=>Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Container(
  //     width: MediaQuery.of(context).size.width /2,
  //     height: 50,
  //     decoration: BoxDecoration(
  //       color: Colors.pink,
  //       borderRadius: BorderRadius.circular(25)
  //     ),
  //     child: Column(
  //       children: [
  //         Text('')
  //       ],
  //     ),
  //   ),
  // );

  Widget ThreeDetail()=>Padding(
    padding: const EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 15),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/2-20,
            // height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:15,bottom: 8),
                    child: Text("Hiện tại",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV1: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' ON'),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV2: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' ON'),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV3: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' OFF'),
                    ],
                  )
                ],
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width/2-20,
            // height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:15,bottom: 8),
                    child: Text("Hiện tại",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV1: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' ON'),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV2: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' ON'),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("KV3: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      Text(' OFF'),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      )
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
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //----------Menu Nhiệt Độ----------
            GestureDetector(
              onTap: (){
                setState(() {
                  indexMenu=1;
                  index = 1;

                  dataChart.removeRange(0, dataChart.length);
                  for (int i=11; i>=0;i--){
                    var t1 = double.parse(dataHome[i].temperature1.toString())/10;
                    var t2 = double.parse(dataHome[i].temperature2.toString())/10;
                    var t3 = double.parse(dataHome[i].temperature3.toString())/10;

                    var tam =chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
                    dataChart.add(tam);
                  }
                  print('-----------------------');
                  setDefaultMINMAXY();
                  // index = 1;
                  // for (int i=0;i<12;i++){
                  //   print("${dataChart[i].date}  ${dataChart[i].time} ${dataChart[i].n1} ${dataChart[i].n2} ${dataChart[i].n3}");
                  // }
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
                  // index = 2;
                  dataChart.removeRange(0, dataChart.length);
                  for (int i=11;i>=0;i--){
                    var t1 = double.parse(dataHome[i].humidity1.toString())/10;
                    var t2 = double.parse(dataHome[i].humidity2.toString())/10;
                    var t3 = double.parse(dataHome[i].humidity3.toString())/10;

                    var tam =chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
                    dataChart.add(tam);
                  }
                  print('-----------------------');
                  setDefaultMINMAXY();

                  // for (int i=0;i<12;i++){
                  //   print("${dataChart[i].date}  ${dataChart[i].time} ${dataChart[i].n1} ${dataChart[i].n2} ${dataChart[i].n3}");
                  // }
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
                  // index = 3;

                  dataChart.removeRange(0, dataChart.length);
                  for (int i=11 ; i>=0 ; i--){
                    var t1 = double.parse(dataHome[i].light1.toString());
                    var t2 = double.parse(dataHome[i].light2.toString());
                    var t3 = double.parse(dataHome[i].light3.toString());

                    var tam =chartData(dataHome[i].date,dataHome[i].time, t1, t2,  t3 );
                    dataChart.add(tam);
                  }
                  print('-----------------------');
                  setDefaultMINMAXY();

                  // for (int i=0;i<12;i++){
                  //   print("${dataChart[i].date}  ${dataChart[i].time} ${dataChart[i].n1} ${dataChart[i].n2} ${dataChart[i].n3}");
                  // }
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
