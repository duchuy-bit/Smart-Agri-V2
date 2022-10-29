import 'package:flutter/material.dart';
import 'package:smartagri/data/datasetField.dart';
import 'package:smartagri/helper/ChangeFloatToDate.dart';

class HomeScreen extends StatefulWidget {
  List <DataSet> dataHome;
  HomeScreen({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState(dataHome);
}

class _HomeScreenState extends State<HomeScreen> {

  final List <DataSet> dataHome;
  _HomeScreenState(this.dataHome);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(Changes().getTime(dataHome[0].time!));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child:
                  ListView(
                    children: <Widget>[
                      Text(''),
                        Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //---------- Hien thi thoi gian, ngay thang va logo Smart Agri--------------
                      Taskbar(),

                      //------------------Text Title Screen -------------------
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: TextHome('Thông số cảm biến', 30, true,Colors.black),
                      ),

                      // -------------Table thông số-------------------
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: PanelHome(1, dataHome[0].temperature1!, dataHome[0].humidity1!, dataHome[0].light1!),
                      ),

                      // -----------------chú thích và ảnh cây sa nhân tím----------------
                      NoteDetail(),
                    ],
                  ),
                    ],
                  )
                ),
              ],
            ),
          ),
      ),
    );
  }

  Widget NoteDetail()=>Container(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset('assets/images/sanhan_tim.png',
                width: MediaQuery.of(context).size.width/2-60,
                height: MediaQuery.of(context).size.width/2-60,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.width/2-60,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat,size: 25),
                      Text(' Nhiệt độ  ',style: TextStyle(fontSize: 20),),
                      Text('℃',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.red),)
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom: 10),
                    child: Row(
                      children: [
                        Icon(Icons.water_drop,size: 25),
                        Text(' Độ ẩm ',style: TextStyle(fontSize: 20),),
                        Text("%",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.blue),)
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.light_mode,size: 25,),
                      Text(' Ánh sáng ',style: TextStyle(fontSize: 20),),
                      Text("lux ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.green),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget Taskbar() =>Padding(
    padding: const EdgeInsets.only(top:60,left: 50,right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------date time-------------
            Row(
              children: [
                Text('${Changes().getTime(dataHome[0].time!)}',style: TextStyle(fontSize: 40),),

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('${Changes().getAMPM(dataHome[0].time!)} ',style: TextStyle(fontSize: 12),),
                ),

                Changes().getIcon(dataHome[0].time!) == 'AM'?
                Icon(Icons.wb_sunny_outlined,size:24):
                Icon(Icons.bedtime_outlined,size:  24),

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_rounded,size: 20,),
                  Text('  ${Changes().DateChange(dataHome[0].date.toString())}')
                ],
              ),
            )
          ],
        ),
        // ---------------------logo ----------------------
        Container(
          height: MediaQuery.of(context).size.width/2-75,
          width: MediaQuery.of(context).size.width/2-75  ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset('assets/images/smartAgri.png'),
        ),
      ],
    ),
  );

  Widget Title()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width*1/4,
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(75),bottomLeft: Radius.circular(75))
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 80,),
        child: Container(
          width: MediaQuery.of(context).size.width*1/3,
          height: MediaQuery.of(context).size.width*1/6,
          decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(75),bottomLeft: Radius.circular(75))
          ),
        ),
      )
    ],
  );

  Widget PanelHome(int stt, num n1, num n2, num n3)=>Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Container(
      width: MediaQuery.of(context).size.width-50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
        padding: const EdgeInsets.only(top:30,left: 30,right: 30,bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
              Text(''),
              Padding(
                padding: const EdgeInsets.only(top: 25,bottom: 20),
                child: Text('Khu vực 1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Text('Khu vực 2',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,top:20),
                child: Text('Khu vực 3',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              ),
            ],),

            RowPanel(1, num.parse(Changes().Humidity(dataHome[0].temperature1.toString())), num.parse(Changes().Humidity(dataHome[0].temperature2.toString())), num.parse(Changes().Humidity(dataHome[0].temperature3.toString()))),
            RowPanel(2, num.parse(Changes().Div10(dataHome[0].humidity1!)), num.parse(Changes().Div10(dataHome[0].humidity2!)), num.parse(Changes().Div10(dataHome[0].humidity3!))),
            RowPanel(3, dataHome[0].light1!, dataHome[0].light2!, dataHome[0].light3!),

          ],
        ),
      )
    ),
  );

  Widget RowPanel(int stt, num n1, num n2, num n3)=>Column(
    children: [
      stt==1? Icon(Icons.thermostat,size: 25,):
          stt==2? Icon(Icons.water_drop,size: 25)
              : Icon(Icons.light_mode,size:25),

      Padding(
        padding: const EdgeInsets.only(top:20,bottom: 20),
        child: Text(n1.toString(),style: TextStyle(fontSize: 16,)),
      ),

      Text(n2.toString(),style: TextStyle(fontSize: 16,)),

      Padding(
        padding: const EdgeInsets.only(bottom: 20,top:20),
        child: Text(n3.toString(),style: TextStyle(fontSize: 16,)),
      )
    ],
  );

  Widget TextHome(String s, double size,bool checkFontWeight,Color color)=>
      checkFontWeight? Text(s,style: TextStyle(fontSize: size,fontWeight: FontWeight.bold,color: color),)
    : Text(s,style: TextStyle(fontSize: size,color: color),);

}
