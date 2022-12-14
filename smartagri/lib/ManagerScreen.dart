import 'package:flutter/material.dart';
import 'package:smartagri/Screen/AccoutScreen.dart';
import 'package:smartagri/Screen/ListScreen.dart';
import 'package:smartagri/Screen/HomeScreen.dart';
import 'package:smartagri/Screen/ListScreen.dart';
import 'package:smartagri/Screen/SettingScreen.dart';
import 'package:smartagri/components/ListComponent.dart';
import 'package:smartagri/data/datasetField.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Screen/ChartScreen.dart';
import 'Screen/Loading.dart';
import 'data/data_sheet_api.dart';
import 'helper/ChangeFloatToDate.dart';


class ManagerScreen extends StatefulWidget {
  const ManagerScreen({Key? key}) : super(key: key);

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  // static DataSet? data ;
  // static DataSet dataTam = new DataSet(date: '44000', time: '0.231', humidity1: 34, humidity2: 32, humidity3: 1, temperature1: 1, temperature2: 1, temperature3: 1, light1: 1, light2: 1, light3: 1, DA_A1_MIN: 1, DA_A1_MAX: 1, DA_A2_MIN: 1, DA_A2_MAX: 1, DA_A3_MIN: 1, DA_A3_MAX: 1, ND_A1_MIN: 1, ND_A1_MAX: 1, ND_A2_MIN: 1, ND_A2_MAX: 1, ND_A3_MIN: 1, ND_A3_MAX: 1, AS_A1_MIN: 1, AS_A1_MAX: 1, AS_A2_MIN: 1, AS_A2_MAX: 1, AS_A3_MIN: 1, AS_A3_MAX: 1, TIME_OFF: 1, TIME_ON: 1, TIME_BN1: 1, TIME_BN2: 1, TIME_BN3: 1, TIME_PS1: 1, TIME_PS2: 1, TIME_PS3: 1, TIME_AS1: 1, TIME_AS2: 1, TIME_AS3: 1);


  static List <DataSet> listData = [
    DataSet(date: '44000', time: '0.231',
      humidity1: 34, humidity2: 32, humidity3: 1,
      temperature1: 1, temperature2: 1, temperature3: 1,
      light1: 1, light2: 1, light3: 1,
      DA_A1_MIN: 1, DA_A1_MAX: 1, DA_A2_MIN: 1, DA_A2_MAX: 1, DA_A3_MIN: 1, DA_A3_MAX: 1,
      ND_A1_MIN: 1, ND_A1_MAX: 1, ND_A2_MIN: 1, ND_A2_MAX: 1, ND_A3_MIN: 1, ND_A3_MAX: 1,
      AS_A1_MIN: 1, AS_A1_MAX: 1, AS_A2_MIN: 1, AS_A2_MAX: 1, AS_A3_MIN: 1, AS_A3_MAX: 1,
      TIME_OFF: 1, TIME_ON: 1,
      TIME_BN1: 1, TIME_BN2: 1, TIME_BN3: 1, TIME_PS1: 1, TIME_PS2: 1, TIME_PS3: 1,
      TIME_AS1: 1, TIME_AS2: 1, TIME_AS3: 1),

  ];
  bool CheckLoadData = false;
  List<DataSet> list1=[];
  List<DataSet> list2=[];
  List<DataSet> list3=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataGgSheet();
  }

  Future refreshData() async {
    setState(() {
      CheckLoadData = false;
    });
    getDataGgSheet();
  }




  Future getDataGgSheet() async {
    await DataSheetApi.initSend();
    final dataTam = await DataSheetApi.getAll();


    setState(() {
      listData = dataTam;
      //-----------Data Home--------
      list1.removeRange(0, list1.length);
      list1.add(listData[0]);
      //---------DataChart ------------
      list2.removeRange(0,list2.length);
      for (int i=0;i< 15;i++) list2.add(listData[i]);
      // //---------DataList----------
      // list3.removeRange(0,list3.length);
      // for (int i=0;i< 100;i++) list3.add(listData[i]);

      CheckLoadData = true;
    });

    if(CheckLoadData) {
      print('Loading Data Success');
      // print(listData[1].humidity1.toString());
      setState(() {
        screens =[
          HomeScreen(dataHome: list1),
          ChartScreen(dataHome: list2),
          ListScreen(dataHome: listData),
          SettingScreen(dataHome: list1,),
          AccountScreen(),
          // ListComponent(dataHome: listData,),

        ];
      });
    }
  }

  int index=0;
  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.bar_chart_rounded, size:30),
    Icon(Icons.format_list_bulleted_rounded, size :30),
    Icon(Icons.miscellaneous_services_rounded, size: 30),
    // handyman_rounded
    // miscellaneous_services_rounded
    // settings
    Icon( Icons.account_circle, size: 30),
  ];

  static List<DataSet> dataSend = [];
  final String a = 'alo';

  // List scre = [
  //   HomeScreen(dataHome: dataHome),
  // ];

  List  screens = [
    // LoadingScreen()
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            color: Color(0xff6849ef),
            buttonBackgroundColor: Color(0xff6849ef),
            backgroundColor: Colors.transparent,
            height: 60,
            items: items,
            index: index,
            onTap: (index)=> setState(()=> this.index=index),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: CheckLoadData == true  ? screens[index] : LoadingScreen(),
        )
        // appBar: ,
        // body: Container(
        //   child: Column(
        //     children: [
        //       ElevatedButton(
        //           onPressed: getDataGgSheet,
        //           child: Text('Get Data')
        //       ),
        //
        //       ElevatedButton(
        //           onPressed: ()=>{
        //             // print(data?.humidity1)
        //             print(Changes().DateChange(data!.date!))
        //           },
        //           child: Text('Print Data')
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
