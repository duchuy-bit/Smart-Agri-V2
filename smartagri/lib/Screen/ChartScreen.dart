import 'package:flutter/material.dart';

import '../data/datasetField.dart';
import '../helper/ChangeFloatToDate.dart';
class ChartScreen extends StatefulWidget {
  List <DataSet> dataHome;
  ChartScreen({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState(dataHome);
}

class _ChartScreenState extends State<ChartScreen> {

  final List <DataSet> dataHome;
  _ChartScreenState(this.dataHome);


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
  bool isAscending = false;

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
              ListView(
                children: <Widget>[
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          child: buildDataTable()
                      )
                  ),
                ],
              )
          )
        ],
      )

      ,
    );
  }

  Widget PanelList()=>Container(
    width: MediaQuery.of(context).size.width,
    // height: 100,
    decoration: const BoxDecoration(
      color: Color(0xff6849ef) ,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            // bottomRight: Radius.circular(-50.0)
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


  Widget buildDataTable() {
    final columns = [
      'Ngày', 'Thời gian', 'Độ ẩm 1', 'Độ ẩm 2', 'Độ ẩm 3',
      'Nhiệt độ 1',"Nhiệt độ 2",'Nhiệt độ 3',
      "Ánh sáng 1",'Ánh sáng 2','Ánh sáng 3'
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTable(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(dataTam),
        ),
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
    label: Text(column,style: TextStyle(fontWeight: FontWeight.bold),),
    onSort: onSort,
  )).toList();

  List<DataRow> getRows(List<DataSet> users) => users.map((DataSet user) {
    String date =Changes().DateChange(user.date!);
    String time = user.time!;
    final cells = [
      date, time,user.humidity1,user.humidity2,user.humidity3,
      user.temperature1,user.temperature2,user.temperature3,
      user.light1,user.light2,user.light3
    ];
    return DataRow(cells: getCells(cells));
  }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, user1.date!, user2.date!));
    } else if (columnIndex == 1) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, user1.time!, user2.time!));
    } else if (columnIndex == 2) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.humidity1}', '${user2.humidity1}'));
    }else if (columnIndex == 3) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.humidity2}', '${user2.humidity2}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.humidity3}', '${user2.humidity3}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.temperature1}', '${user2.temperature1}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.temperature2}', '${user2.temperature2}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.temperature3}', '${user2.temperature3}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.light1}', '${user2.light1}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.light2}', '${user2.light2}'));
    }else if (columnIndex ==4) {
      dataTam.sort((user1, user2) =>
          compareString(ascending, '${user1.light3}', '${user2.light3}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


}
