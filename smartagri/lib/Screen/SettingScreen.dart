
import 'package:flutter/material.dart';
import 'package:smartagri/data/dataSendField.dart';
import 'package:smartagri/data/data_sheet_api.dart';

import '../data/datasetField.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:custom_switch/custom_switch.dart';


// import '../helper/ChangeFloatToDate.dart';

class SettingScreen extends StatefulWidget {
  List <DataSet> dataHome;
  SettingScreen({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState(dataHome);
}

class _SettingScreenState extends State<SettingScreen> {

  final List <DataSet> dataHome;
  _SettingScreenState(this.dataHome);


  // TextEditingController? _controllerTimeStart;
  // TextEditingController? _controllerTimeEnd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (dataHome[0].TIME_ON!.toInt() >= 10 ) selectedValueStart = dataHome[0].TIME_ON!.toInt().toString() + ":00";
    else selectedValueStart = "0" + dataHome[0].TIME_ON!.toInt().toString() + ":00";

    if (dataHome[0].TIME_OFF!.toInt() >= 10 ) selectedValueEnd = dataHome[0].TIME_OFF!.toInt().toString() + ":00";
    else selectedValueEnd = "0" + dataHome[0].TIME_OFF!.toInt().toString() + ":00";
    print('start ${selectedValueStart} -> ${selectedValueEnd}');

    //---------INIT DataSetting
    setState(() {
      // dataSetting.removeRange(0, dataSetting.length);

      // //-Min
      // double t1 = double.parse(dataHome[0].ND_A1_MIN.toString())/10;       dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].ND_A2_MIN.toString())/10;    dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].ND_A3_MIN.toString())/10;      dataSetting.add(t1);
      // //-MAX-
      // t1 = double.parse(dataHome[0].ND_A1_MAX.toString())/10;       dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].ND_A2_MAX.toString())/10;    dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].ND_A3_MAX.toString())/10;      dataSetting.add(t1);
      // //--BUTTON--
      // dataSetting.add(dataHome[0].TIME_PS1);
      // dataSetting.add(dataHome[0].TIME_PS2);
      // dataSetting.add(dataHome[0].TIME_PS3);
      // //-Present-
      // t1 = double.parse(dataHome[0].temperature1.toString())/10;       dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].temperature2.toString())/10;        dataSetting.add(t1);
      // t1 = double.parse(dataHome[0].temperature3.toString())/10;       dataSetting.add(t1);

      // txtKv1Min.text = dataSetting[0].toString(); txtKv2Min.text = dataSetting[1].toString(); txtKv3Min.text = dataSetting[2].toString();
      // txtKv1Max.text = dataSetting[3].toString(); txtKv2Max.text = dataSetting[4].toString(); txtKv3Max.text = dataSetting[5].toString();
      // ChangeControllerTextInput();

      // dataSetting.forEach((element)
      // {
      //   print('$element ');
      // });

      //----------DataSended------------------

      DateTime now = new DateTime.now();
      dataSended.removeRange(0, dataSended.length);
      dataSended.add('${now.day}/${now.month}/${now.year}');
      dataSended.add('${now.hour}:${now.minute}:${now.second}');
      double t1=0.0;
      t1 = double.parse(dataHome[0].DA_A1_MIN.toString())/10; dataSended.add(t1);
      t1 = double.parse(dataHome[0].DA_A1_MAX.toString())/10; dataSended.add(t1);
      t1 = double.parse(dataHome[0].DA_A2_MIN.toString())/10; dataSended.add(t1);
      t1 = double.parse(dataHome[0].DA_A2_MAX.toString())/10; dataSended.add(t1);
      t1 = double.parse(dataHome[0].DA_A3_MIN.toString())/10; dataSended.add(t1);
      t1 = double.parse(dataHome[0].DA_A3_MAX.toString())/10; dataSended.add(t1);

      t1 = double.parse(dataHome[0].ND_A1_MIN.toString())/10;dataSended.add(t1);
      t1 = double.parse(dataHome[0].ND_A1_MAX.toString())/10;dataSended.add(t1);
      t1 = double.parse(dataHome[0].ND_A2_MIN.toString())/10;dataSended.add(t1);
      t1 = double.parse(dataHome[0].ND_A2_MAX.toString())/10;dataSended.add(t1);
      t1 = double.parse(dataHome[0].ND_A3_MIN.toString())/10;dataSended.add(t1);
      t1 = double.parse(dataHome[0].ND_A3_MAX.toString())/10;dataSended.add(t1);

      dataSended.add(dataHome[0].AS_A1_MIN); dataSended.add(dataHome[0].AS_A1_MAX);
      dataSended.add(dataHome[0].AS_A2_MIN); dataSended.add(dataHome[0].AS_A2_MAX);
      dataSended.add(dataHome[0].AS_A3_MIN); dataSended.add(dataHome[0].AS_A3_MAX);

      dataSended.add(dataHome[0].TIME_OFF); dataSended.add(dataHome[0].TIME_ON);

      dataSended.add(dataHome[0].TIME_BN1); dataSended.add(dataHome[0].TIME_BN2);dataSended.add(dataHome[0].TIME_BN3);
      dataSended.add(dataHome[0].TIME_PS1); dataSended.add(dataHome[0].TIME_PS2);dataSended.add(dataHome[0].TIME_PS3);
      dataSended.add(dataHome[0].TIME_AS1); dataSended.add(dataHome[0].TIME_AS2);dataSended.add(dataHome[0].TIME_AS3);

      ChangeControllerTextInput();
    });
    // _controllerTimeStart = new TextEditingController(text: '8');
    // _controllerTimeEnd = new TextEditingController(text: '9');
  }

  List dataSended =[];

  void sendData(){
    print("--------------------------Data Send ------------------------------");

    DateTime now = new DateTime.now();
    dataSended[0] = '${now.day}/${now.month}/${now.year}';
    dataSended[1] = '${now.hour}:${now.minute}:${now.second}';
    print('${dataSended[0]} ${dataSended[1]}');
    print(' - Độ ẩm');
    print('KV1: ${dataSended[2]} ${dataSended[3]}  -KV2: ${dataSended[4]} ${dataSended[5]}  -KV3: ${dataSended[6]} ${dataSended[7]}');
    print(' - Nhiệt độ');
    print('KV1: ${dataSended[8]} ${dataSended[9]}  -KV2: ${dataSended[10]} ${dataSended[11]}  -KV3: ${dataSended[12]} ${dataSended[13]}');
    print(' - Ánh sáng');
    print('KV1: ${dataSended[14]} ${dataSended[15]}  -KV2: ${dataSended[16]} ${dataSended[17]}  -KV3: ${dataSended[18]} ${dataSended[19]}');

    print(' - TIME ON-OFF');
    print('-ON: ${dataSended[21]}    OFF: ${dataSended[20]}   ');

    print(' - BƠM: ');
    print('KV1: ${dataSended[22]}   -KV2: ${dataSended[23]}    -KV3: ${dataSended[24]}');

    print(' - PHUN SƯƠNG: ');
    print('KV1: ${dataSended[25]}   -KV2: ${dataSended[26]}    -KV3: ${dataSended[27]}');

    print(' - ĐÈN: ');
    print('KV1: ${dataSended[28]}   -KV2: ${dataSended[29]}    -KV3: ${dataSended[30]}');

    // DateTime tamH= new DateTime()

    final listTam={
      DataSendSetFields.date : dataSended[0],  DataSendSetFields.time: dataSended[1],

      DataSendSetFields.DA_A1_MIN : dataSended[2] , DataSendSetFields.DA_A1_MAX : dataSended[3] ,
      DataSendSetFields.DA_A2_MIN : dataSended[4] , DataSendSetFields.DA_A2_MAX : dataSended[5] ,
      DataSendSetFields.DA_A3_MIN : dataSended[6] , DataSendSetFields.DA_A3_MAX : dataSended[7] ,

      DataSendSetFields.ND_A1_MIN : dataSended[8] , DataSendSetFields.ND_A1_MAX : dataSended[9] ,
      DataSendSetFields.ND_A2_MIN : dataSended[10] , DataSendSetFields.ND_A2_MAX : dataSended[11] ,
      DataSendSetFields.ND_A3_MIN : dataSended[12] , DataSendSetFields.ND_A3_MAX : dataSended[13] ,

      DataSendSetFields.AS_A1_MIN : dataSended[14] , DataSendSetFields.AS_A1_MAX : dataSended[15] ,
      DataSendSetFields.AS_A2_MIN : dataSended[16] , DataSendSetFields.AS_A2_MAX : dataSended[17] ,
      DataSendSetFields.AS_A3_MIN : dataSended[18] , DataSendSetFields.AS_A3_MAX : dataSended[19] ,

      DataSendSetFields.TIME_OFF : dataSended[20] , DataSendSetFields.TIME_ON : dataSended[21] ,

      DataSendSetFields.TIME_BN1 : dataSended[22] , DataSendSetFields.TIME_BN2 : dataSended[23] , DataSendSetFields.TIME_BN3 : dataSended[24] ,
      DataSendSetFields.TIME_PS1 : dataSended[25] , DataSendSetFields.TIME_PS2 : dataSended[26] , DataSendSetFields.TIME_PS3 : dataSended[27] ,
      DataSendSetFields.TIME_AS1 : dataSended[28] , DataSendSetFields.TIME_AS2 : dataSended[29] , DataSendSetFields.TIME_AS3 : dataSended[30] ,
    };
    DataSheetApi.insertSend([listTam]).whenComplete(() =>
    {
      Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            print("Send Success");
            Navigator.pop(context);
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Chúc mừng'),
                content: const Text('Đã Thiết Lập Thành Công'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          // Here you can write your code for open new view
          });
      }),
    });
  }

  void ChangeControllerTextInput(){
    setState(() {
      if(index == 1){
        txtKv1Min.text= dataSended[8].toString();  txtKv2Min.text= dataSended[10].toString() ; txtKv3Min.text= dataSended[12].toString();
        txtKv1Max.text= dataSended[9].toString();  txtKv2Max.text= dataSended[11].toString() ; txtKv3Max.text= dataSended[13].toString();

        if(dataSended[25] ==1) switch1 = false; else switch1 = true;
        if(dataSended[26] ==1) switch2 = false; else switch2 = true;
        if(dataSended[27] ==1) switch3 = false; else switch3 = true;
      }else if (index==2 ){
        txtKv1Min.text= dataSended[2].toString();  txtKv2Min.text= dataSended[4].toString() ; txtKv3Min.text= dataSended[6].toString();
        txtKv1Max.text= dataSended[3].toString();  txtKv2Max.text= dataSended[5].toString() ; txtKv3Max.text= dataSended[7].toString();

        if(dataSended[22] ==1) switch1 = false; else switch1 = true;
        if(dataSended[23] ==1) switch2 = false; else switch2 = true;
        if(dataSended[24] ==1) switch3 = false; else switch3 = true;
      }else {
        txtKv1Min.text= dataSended[14].toString();  txtKv2Min.text= dataSended[16].toString() ; txtKv3Min.text= dataSended[18].toString();
        txtKv1Max.text= dataSended[15].toString();  txtKv2Max.text= dataSended[17].toString() ; txtKv3Max.text= dataSended[19].toString();

        if(dataSended[28] == 1) switch1 = false; else switch1 = true;
        if(dataSended[29] ==1) switch2 = false; else switch2 = true;
        if(dataSended[30] ==1) switch3 = false; else switch3 = true;
      }
      // txtKv1Min.text = dataSetting[0].toString(); txtKv2Min.text = dataSetting[1].toString(); txtKv3Min.text = dataSetting[2].toString();
      // txtKv1Max.text = dataSetting[3].toString(); txtKv2Max.text = dataSetting[4].toString(); txtKv3Max.text = dataSetting[5].toString();
    });
  }

  // List dataSetting=[];

  final List<String> items = ['00:00','01:00','02:00','03:00','04:00','05:00','06:00','07:00','08:00','09:00','10:00','11:00',
    '12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00'];
  String? selectedValueStart;
  String? selectedValueEnd;

  TextEditingController txtKv1Min = TextEditingController();
  TextEditingController txtKv2Min = TextEditingController();
  TextEditingController txtKv3Min = TextEditingController();

  TextEditingController txtKv1Max = TextEditingController();
  TextEditingController txtKv2Max = TextEditingController();
  TextEditingController txtKv3Max = TextEditingController();


  int index=1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/60year.jpg"),
            //   fit: BoxFit.cover,
            // ),
            color: Colors.purple[100] ,
            gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffe1bee7),
                  Color(0xfff3e5f5),
                  // Color(0xffFFFFFF)
                  // Colors.grey[200]
                ]
            )
        ),
        child:Column(
          children: [
            //-----------------PANEL------------------
            Stack(
              children: <Widget>[
                BackgroundPanel(),
                IconPanel(),
              ],
            ),

            //------------THIET LAP THOI GIAN BAT DAU VA KET THUC -------------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TimeStartAndEndV3(),

                    MenuContainer(),

                    InputMinMaxContainer(),

                    SwitchONOFF(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool switch1 = true;
  bool switch2 = false;
  bool switch3 = true;


  Widget SwitchONOFF()=> Padding(
    padding: const EdgeInsets.only(top: 18,bottom: 10),
    child: Container(
      width:MediaQuery.of(context).size.width-60 ,
      // height: 200,
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
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 15),
            child: Text('Thời gian đóng/mở thiết bị',style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('KV-1: ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                  FlutterSwitch(
                    showOnOff: true,
                    width: 80,
                    activeTextColor: Colors.black,
                    inactiveTextColor: Colors.black,
                    activeColor: Colors.lightBlueAccent,
                    activeText: "Manu",
                    inactiveText: "Auto",
                    value: switch1,
                    onToggle: (val) {
                      setState(() {
                        switch1=val;
                        // if (val == true) dataSetting[6] = 0;
                        // else dataSetting[6] =1;

                        if (index == 1) dataSended[25] = val == true? 0: 1;
                        else if (index == 2) dataSended[22] = val == true? 0: 1;
                        else dataSended[28] = val == true? 0: 1;
                      });
                    },
                  ),

                ],
              ),
              SizedBox(width: 10,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('KV-2: ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue)),

                  FlutterSwitch(
                    showOnOff: true,
                    width: 80,
                    activeTextColor: Colors.black,
                    inactiveTextColor: Colors.black,
                    activeColor: Colors.lightBlueAccent,
                    activeText: "Manu",
                    inactiveText: "Auto",
                    value: switch2,
                    onToggle: (val) {
                      setState(() {
                        // if (val == true) dataSetting[7] = 0;
                        // else dataSetting[7] =1;
                        switch2=val;

                        if (index == 1) dataSended[26] = val == true? 0: 1;
                        else if (index == 2) dataSended[23] = val == true? 0: 1;
                        else dataSended[29] = val == true? 0: 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15,top:15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('KV-3: ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green)),

                FlutterSwitch(
                  showOnOff: true,
                  width: 80,
                  activeTextColor: Colors.black,
                  activeColor: Colors.lightBlueAccent,
                  inactiveTextColor: Colors.black,
                  activeText: "Manu",
                  inactiveText: "Auto",
                  value: switch3,
                  onToggle: (val) {
                    setState(() {
                      // if (val == true) dataSetting[8] = 0;
                      // else dataSetting[8] =1;
                      switch3=false;

                      if (index == 1) dataSended[27] = val == true? 0: 1;
                      else if (index == 2) dataSended[24] = val == true? 0: 1;
                      else dataSended[30] = val == true? 0: 1;
                    });
                  },
                ),
              ],
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Auto:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                  Text(' Luôn luôn đóng/ngắt     ',style: TextStyle(color: Colors.black,fontSize: 16),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:5,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Manu:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    Text(' Theo thời gian thiết lập',style: TextStyle(color: Colors.black,fontSize: 16),),
                  ],
                ),
              )
          //   ],
          // )
        ],
      ),
    ),
  );

  Widget InputMinMaxContainer()=>Container(
    width: MediaQuery.of(context).size.width-60,
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Nhập ngưỡng thiết lập',style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        //--------------MIN MAX -------------------
        Padding(
          padding: const EdgeInsets.only(top:20,bottom: 20,left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputMin(),
              InputMax()
            ],
          ),
        )
      ],
    ),
  );

  Widget InputMin()=>Container(
    child: Column(
      children: [
        Row(
          children: [
            Text('KV1-MIN ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    print("input ${double.parse(value.toString())}");
                    if (index == 1) dataSended[8] = value;
                    else if( index ==2 ) dataSended[2] = value;
                    else dataSended[14] = value;
                  },
                  controller: txtKv1Min,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: 'Email',
                    // labelText: 'alo'
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),

        Row(
          children: [
            Text('KV2-MIN ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    print("input $value");

                    if (index == 1) dataSended[10] = value;
                    else if( index ==2 ) dataSended[4] = value;
                    else dataSended[16] = value;
                  },
                  controller: txtKv2Min,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: 'Email',
                    // labelText: 'alo'
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 5,),

        Row(
          children: [
            Text('KV3-MIN ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    print("input $value");
                    
                    if (index == 1) dataSended[12] = value;
                    else if( index ==2 ) dataSended[6] = value;
                    else dataSended[18] = value;
                  },
                  controller: txtKv3Min,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText: 'Email',
                    // labelText: 'alo'
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );

  Widget InputMax()=>Container(
    child: Column(
      children: [
        Row(
          children: [
            Text('KV1-MAX ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    if (index == 1) dataSended[9] = value;
                    else if( index ==2 ) dataSended[3] = value;
                    else dataSended[15] = value;
                  },
                  controller: txtKv1Max,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 5,),

        Row(
          children: [
            Text('KV2-MAX ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.blue)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    if (index == 1) dataSended[11] = value;
                    else if( index ==2 ) dataSended[5] = value;
                    else dataSended[17] = value;
                  },
                  controller: txtKv2Max,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 5,),

        Row(
          children: [
            Text('KV3-MAX ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.green)),
            Container(
              width: 55,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: TextField(
                  onChanged: (value){
                    if (index == 1) dataSended[13] = value;
                    else if( index ==2 ) dataSended[7] = value;
                    else dataSended[19] = value;
                  },
                  controller: txtKv3Max,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );

  Widget MenuContainer()=>Padding(
    padding: const EdgeInsets.only(top:18,left: 35,right: 35,bottom: 18),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuSetting(),
          DataPresent()
        ],
      ),
    ),
  );

  Widget DataPresent()=>Container(
    width: MediaQuery.of(context).size.width *2/5-10,
    height: 150,
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
            child: Text("Hiện tại",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("KV-1:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red)),
              index ==1? Text("${double.parse(dataHome[0].temperature1.toString())/10}",style: TextStyle(fontSize: 16)):
                  index == 2? Text("${double.parse(dataHome[0].humidity1.toString())/10}",style: TextStyle(fontSize: 16)):
                  Text("${dataHome[0].light1}",style: TextStyle(fontSize: 16)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2,bottom: 2),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("KV-2:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue)),
                index ==1? Text("${double.parse(dataHome[0].temperature2.toString())/10}",style: TextStyle(fontSize: 16)):
                index == 2? Text("${double.parse(dataHome[0].humidity2.toString())/10}",style: TextStyle(fontSize: 16)):
                Text("${dataHome[0].light2}",style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("KV-3:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
              index ==1? Text("${double.parse(dataHome[0].temperature3.toString())/10}",style: TextStyle(fontSize: 16)):
              index == 2? Text("${double.parse(dataHome[0].humidity3.toString())/10}",style: TextStyle(fontSize: 16)):
              Text("${dataHome[0].light3}",style: TextStyle(fontSize: 16)),
            ],
          )
        ],
      ),
    ),
  );

  Widget MenuAnimation()=> AnimatedAlign(
    duration: Duration(milliseconds: 500),
    curve: Curves.fastOutSlowIn,
    alignment:
    index == 1? AlignmentDirectional.topCenter:
                  index == 2?
                  Alignment.center
                      : AlignmentDirectional.bottomCenter,
    child:  Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
          child: Row(
             mainAxisAlignment:  MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               index == 1? Text('Nhiệt độ ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),):
                   index == 2? Text('Độ ẩm ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),):
                    Text('Ánh sáng ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
               Icon(Icons.arrow_right_rounded, color: Colors.white),
             ],
          ),
        ),
    ),
  );

  Widget MenuBackGround()=>Container(

    // width: 150,
    // height: 200,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              index = 1;
              ChangeControllerTextInput();
              // print('index = $index');
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Nhiệt độ ',style: TextStyle(color:  Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),],
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            setState(() {
              index = 2;
              ChangeControllerTextInput();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,    crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Độ ẩm ',style: TextStyle(color: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),],
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            setState(() {
              index = 3;
              ChangeControllerTextInput();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('Ánh sáng ',style: TextStyle(color: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),), ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget MenuSetting()=>Container(
    width: MediaQuery.of(context).size.width*2/5,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.white,  //purple[100]
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
      padding: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MenuBackGround(),
          MenuAnimation(),
        ],
      )
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     //---------------------------NHIỆT ĐỘ --------------------------
      //     AnimatedOpacity(
      //       duration: Duration( milliseconds: 300),
      //       opacity: index == 1? 1.0: 0.0,
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.deepPurple,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
      //           child: Row(
      //             mainAxisAlignment: index == 1? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text('Nhiệt độ ',style: TextStyle(color: index == 1? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //               Icon(Icons.arrow_right_rounded, color: Colors.white),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       onTap: (){
      //         setState(() {
      //           index= 1;
      //           print("Menu $index");
      //           //---REMOVE DATASETING----
      //           dataSetting.removeRange(0, dataSetting.length);
      //
      //           //-Min
      //           double t1 = double.parse(dataSended[8].toString())/10;       dataSetting.add(t1);
      //           t1 = double.parse(dataSended[10].toString())/10;    dataSetting.add(t1);
      //           t1 = double.parse(dataSended[12].toString())/10;      dataSetting.add(t1);
      //           //-MAX-
      //           t1 = double.parse(dataSended[9].toString())/10;       dataSetting.add(t1);
      //           t1 = double.parse(dataSended[11].toString())/10;    dataSetting.add(t1);
      //           t1 = double.parse(dataSended[13].toString())/10;      dataSetting.add(t1);
      //           //--BUTTON--
      //           dataSetting.add(dataSended[25]);
      //           dataSetting.add(dataSended[26]);
      //           dataSetting.add(dataSended[27]);
      //           //-Present-
      //           t1 = double.parse(dataHome[0].temperature1.toString())/10;       dataSetting.add(t1);
      //           t1 = double.parse(dataHome[0].temperature2.toString())/10;        dataSetting.add(t1);
      //           t1 = double.parse(dataHome[0].temperature3.toString())/10;       dataSetting.add(t1);
      //
      //           // txtKv1Min.text = dataSetting[0].toString();
      //           ChangeControllerTextInput();
      //         });
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
      //         child: Row(
      //           mainAxisAlignment: index == 1? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Text('Nhiệt độ ',style: TextStyle(color: index == 1? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //             Icon(Icons.arrow_right_rounded, color: Colors.white),
      //           ],
      //         ),
      //       ),
      //     ),
      //     //-------------------ĐỘ ẨM----------------------
      //     Stack(
      //       children: [
      //         AnimatedOpacity(
      //           duration: Duration( milliseconds: 300),
      //           opacity: index == 2? 1.0: 0.0,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.deepPurple,
      //               borderRadius: BorderRadius.circular(50),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
      //               child: Row(
      //                 mainAxisAlignment: index == 2? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 children: [
      //                   Text('Độ ẩm  ',style: TextStyle(color: index == 2? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //                   // index == 2?
      //                   Icon(Icons.arrow_right_rounded, color: Colors.white)
      //                   // : Text(''),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: (){
      //             setState(() {
      //               index= 2;
      //               print("Menu $index");
      //               //---REMOVE DATASETING----
      //               dataSetting.removeRange(0, dataSetting.length);
      //
      //               //-Min
      //               double t1 = double.parse(dataSended[2].toString())/10;       dataSetting.add(t1);
      //               t1 = double.parse(dataSended[4].toString())/10;    dataSetting.add(t1);
      //               t1 = double.parse(dataSended[6].toString())/10;      dataSetting.add(t1);
      //               //-MAX-
      //               t1 = double.parse(dataSended[3].toString())/10;       dataSetting.add(t1);
      //               t1 = double.parse(dataSended[5].toString())/10;    dataSetting.add(t1);
      //               t1 = double.parse(dataSended[7].toString())/10;      dataSetting.add(t1);
      //               //--BUTTON--
      //               dataSetting.add(dataSended[22]);
      //               dataSetting.add(dataSended[23]);
      //               dataSetting.add(dataSended[24]);
      //               //-Present-
      //               t1 = double.parse(dataHome[0].humidity1.toString())/10;       dataSetting.add(t1);
      //               t1 = double.parse(dataHome[0].humidity2.toString())/10;        dataSetting.add(t1);
      //               t1 = double.parse(dataHome[0].humidity3.toString())/10;       dataSetting.add(t1);
      //
      //               ChangeControllerTextInput();
      //             });
      //           },
      //           child: Padding(
      //             padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
      //             child: Row(
      //               mainAxisAlignment: index == 2? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Text('Độ ẩm  ',style: TextStyle(color: index == 2? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //                 // index == 2?
      //                 Icon(Icons.arrow_right_rounded, color: Colors.white)
      //                 // : Text(''),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     //------------------------ÁNH SÁNG -----------------
      //     Stack(
      //       children: [
      //         AnimatedOpacity(
      //           duration: Duration( milliseconds: 300),
      //           opacity: index == 3 ? 1.0: 0.0,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.deepPurple,
      //               borderRadius: BorderRadius.circular(50),
      //             ),
      //             child: GestureDetector(
      //               onTap: (){
      //                 setState(() {
      //                   index= 3;
      //                   print("Menu $index");
      //                   //---REMOVE DATASETING----
      //                   dataSetting.removeRange(0, dataSetting.length);
      //
      //                   //-Min
      //                   dataSetting.add(dataSended[14]);
      //                   dataSetting.add(dataSended[16]);
      //                   dataSetting.add(dataSended[18]);
      //                   //-MAX---
      //                   dataSetting.add(dataSended[15]);
      //                   dataSetting.add(dataSended[17]);
      //                   dataSetting.add(dataSended[19]);
      //                   //--BUTTON--
      //                   dataSetting.add(dataSended[28]);
      //                   dataSetting.add(dataSended[29]);
      //                   dataSetting.add(dataSended[30]);
      //                   //-Present-
      //                   dataSetting.add(dataHome[0].light1);
      //                   dataSetting.add(dataHome[0].light2);
      //                   dataSetting.add(dataHome[0].light3);
      //
      //                   // dataSetting.forEach((element) {print(element.toString());});
      //
      //                   ChangeControllerTextInput();
      //                 });
      //               },
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 14),
      //                 child: Row(
      //                   mainAxisAlignment: index == 3? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Text('Ánh sáng',style: TextStyle(color: index == 3? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //                     // index == 3?
      //                     Icon(Icons.arrow_right_rounded, color: Colors.white)
      //                     // : Text(''),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: (){
      //             setState(() {
      //               index= 3;
      //               print("Menu $index");
      //               //---REMOVE DATASETING----
      //               dataSetting.removeRange(0, dataSetting.length);
      //
      //               //-Min
      //               dataSetting.add(dataSended[14]);
      //               dataSetting.add(dataSended[16]);
      //               dataSetting.add(dataSended[18]);
      //               //-MAX---
      //               dataSetting.add(dataSended[15]);
      //               dataSetting.add(dataSended[17]);
      //               dataSetting.add(dataSended[19]);
      //               //--BUTTON--
      //               dataSetting.add(dataSended[28]);
      //               dataSetting.add(dataSended[29]);
      //               dataSetting.add(dataSended[30]);
      //               //-Present-
      //               dataSetting.add(dataHome[0].light1);
      //               dataSetting.add(dataHome[0].light2);
      //               dataSetting.add(dataHome[0].light3);
      //
      //               // dataSetting.forEach((element) {print(element.toString());});
      //
      //               ChangeControllerTextInput();
      //             });
      //           },
      //           child: Padding(
      //             padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 14),
      //             child: Row(
      //               mainAxisAlignment: index == 3? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Text('Ánh sáng',style: TextStyle(color: index == 3? Colors.white: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),),
      //                 // index == 3?
      //                 Icon(Icons.arrow_right_rounded, color: Colors.white)
      //                 // : Text(''),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    ),
  );


  Widget TimeStartAndEndV3()=>Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      width: MediaQuery.of(context).size.width-50,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Giờ khởi động:',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: items.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.deepPurple,),
                        overflow: TextOverflow.ellipsis,), )).toList(),
                value: selectedValueStart,
                onChanged: (value) {
                  setState(() {
                    selectedValueStart = value as String;
                    dataSended[21] = value;
                  });
                },
                buttonWidth: 75,   buttonPadding: const EdgeInsets.only(left: 8, right: 0),
                buttonDecoration: BoxDecoration( borderRadius: BorderRadius.circular(75),  color: Colors.white,  ),
                itemHeight: 40,   itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 75,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration( borderRadius: BorderRadius.circular(14),  color: Colors.white,  ),
                scrollbarRadius: const Radius.circular(40), scrollbarThickness: 6, scrollbarAlwaysShow: false,
              ),
            ),
            Icon(Icons.arrow_circle_right_rounded ,color: Colors.white,size: 30),

            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: items.map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.deepPurple,),
                        overflow: TextOverflow.ellipsis,),)).toList(),
                value: selectedValueEnd,
                onChanged: (value) {
                  setState(() {
                    selectedValueEnd = value as String;
                    dataSended[20] = value;
                  });
                },
                buttonWidth: 75,
                buttonPadding: const EdgeInsets.only(left: 8, right: 0),
                buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(75),color: Colors.white,),
                itemHeight: 40, itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 100,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Colors.white,),
                scrollbarRadius: const Radius.circular(40),scrollbarThickness: 6, scrollbarAlwaysShow: false,
              ),
            ),
          ],
        ),
      ),
    ),
  );



  Widget IconPanel()=>Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 45,right: 30),
      child: GestureDetector(
        onTap: (){
          showLoaderDialog(context);
          sendData();
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(Icons.send_rounded,size: 35,color: Colors.white,),
        ),
      ),
    ),
  );

  Widget BackgroundPanel()=>Container(
    width: MediaQuery.of(context).size.width,
    height: 80,
    decoration: BoxDecoration(
      color: Colors.deepPurpleAccent,

      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50)
      ),
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
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('Thiết lập', style: TextStyle( fontSize: 25,  fontWeight: FontWeight.bold,color: Colors.white,),),
            Text('   Ngưỡng cảm biến',style: TextStyle( fontSize: 25,  fontWeight: FontWeight.bold,color: Colors.white,),),
        ],
      ),
    ),
  );

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
