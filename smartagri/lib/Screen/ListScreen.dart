import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:smartagri/components/ListComponent.dart';

import '../data/datasetField.dart';
import '../helper/ChangeFloatToDate.dart';
class ListScreen extends StatefulWidget {
  List <DataSet> dataHome;
  ListScreen({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState(dataHome);
}

class _ListScreenState extends State<ListScreen> {

  final List <DataSet> dataHome;
  _ListScreenState(this.dataHome);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ------------init gia tri lọc: gia trị bắt đầu, kết thúc;---------------
    // giá trị thời ian lớn nhất và nhỏ nhất để kiểm tra lỗi loc -----------------
    setState(() {
      dateStart  = DateTime(
          Changes().changeDoubleToDate(dataHome[0].date!).year,
          Changes().changeDoubleToDate(dataHome[0].date!).month,
          Changes().changeDoubleToDate(dataHome[0].date!).day);
      dateFinish  = DateTime(
          Changes().changeDoubleToDate(dataHome[0].date!).year,
          Changes().changeDoubleToDate(dataHome[0].date!).month,
          Changes().changeDoubleToDate(dataHome[0].date!).day);
      dateStartCheck = DateTime(
          Changes().changeDoubleToDate(dataHome[dataHome.length-1].date!).year,
          Changes().changeDoubleToDate(dataHome[dataHome.length-1].date!).month,
          Changes().changeDoubleToDate(dataHome[dataHome.length-1].date!).day);
      dateFinishCheck = DateTime(
          Changes().changeDoubleToDate(dataHome[0].date!).year,
          Changes().changeDoubleToDate(dataHome[0].date!).month,
          Changes().changeDoubleToDate(dataHome[0].date!).day);
    });
    //---------------loc gia tri để lấy thông số ngày cuối cùng------------------
    LocData();
  }

  //----------------------------------------------------------------
  //----------------------------------------------------------------
  List <DataSet> dataTam =[];

  DateTime dateStart = DateTime(2022, 11, 27);
  DateTime dateFinish = DateTime(2022, 08, 16);
  DateTime dateFinishCheck = DateTime(2022, 08, 16);
  DateTime dateStartCheck = DateTime(2022, 08, 16);

  int? sortColumnIndex = 0;
  // bool isAscending = false;

  String DateErrol = '';
  String DateErrolFinish = '';
  //----------------------------------------------------------------
  //----------------------------------------------------------------

//-------------------------function loc du lieu-----------------
  void LocData(){
    DateTime datatam = DateTime(2021, 11, 27);
    setState(() {
      dataTam.removeRange(0, dataTam.length);
      print('du lieu :');

      for(int i=0 ; i<dataHome.length ; i++)
      {
        datatam = DateTime(
          Changes().changeDoubleToDate(dataHome[i].date!).year,
          Changes().changeDoubleToDate(dataHome[i].date!).month,
          Changes().changeDoubleToDate(dataHome[i].date!).day,
        );

        if(dateStart.compareTo(datatam)<=0 && dateFinish.compareTo(datatam) >= 0)
        {
          dataTam.add(dataHome[i]);
          print('${datatam.day} / ${datatam.month} / ${datatam.year}');
        }
      }

      print('Sau khi loc dc ${dataTam.length} hang du lieu');
    });
  }

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          //-----------------------------Pannel Tiêu đề-----------------------------------
          PanelList(),

          //----------------------------Pannel hiển thị số dòng dữ liệu được lọc------------------------------------
          PanelLengthList(),

          //-----------------Table dữ liệu được lọc --------------------
          Flexible(
              child:
                ListComponent(dataHome: dataTam,)
          )
        ],
      ),
    );
  }

  Widget PanelList()=>Container(
    width: MediaQuery.of(context).size.width,
    // height: 100,
    decoration: const BoxDecoration(
      color: Color(0xff6849ef) ,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
        ),
      gradient: LinearGradient(
          colors: [
            Color(0xff6849ef),
            Color(0xff886ff2),
          ]
      )
    ),
    child: Title(),
  );

  Widget Title()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:   [
      Padding(
        padding: EdgeInsets.all(20),
        child: Text('Lọc theo ngày',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 20,right: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dữ liệu được hiển thị từ ngày ',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 40,bottom: 20,right: 40,top:15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: dateStart,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                //-------------------------người dùng Cancel việc nhập dữ liệu---------------------------------------
                if(newDate == null) return;

                //-------------------------------Check lỗi---------------------------------
                if(newDate.compareTo(dateStartCheck)< 0 ){
                  print('loi');

                  //----------------------------Alert thông báo lỗi------------------------------------
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Lỗi'),
                      content: const Text('Vui lòng nhập ngày Bắt đầu lớn hơn'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return ;
                }
                //-----------------------nếu không lỗi thì lấy dữ liệu và lọc-----------------------------------------
                setState(() {
                  DateErrol = '';
                  dateStart = newDate;
                });
                LocData();
              },
              child: Container(
                height: 38,
                // width: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Text('  ${dateStart.day}/${dateStart.month}/${dateStart.year}  ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),

            Text(' Đến ngày: ',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),

            GestureDetector(
              onTap: () async {
                DateTime? newDate1 = await showDatePicker(
                  context: context,
                  initialDate: dateFinish,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );

                if(newDate1 == null) return;

                if(newDate1.compareTo(dateFinishCheck)> 0 ){
                  print('loi');

                  //-------------------------Alert thông báo lỗi---------------------------------------
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Lỗi'),
                      content: const Text('Vui lòng nhập ngày Kết thúc Nhỏ hơn'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  return ;
                }

                setState(() {
                  DateErrolFinish='';
                  dateFinish = newDate1;
                });

                LocData();
              },
              child: Container(
                height: 38,
                // width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Text('  ${dateFinish.day}/${dateFinish.month}/${dateFinish.year}  ',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),

    ],
  );

  Widget PanelLengthList()=>
  Container(
      color: const  Color(0xff886ff2),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white ,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(70.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:16,left: 25),
          child: Text('${dataTam.length} dòng dữ liệu',style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
        ),
      ),

  );


}
