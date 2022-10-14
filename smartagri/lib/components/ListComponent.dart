import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:smartagri/helper/ChangeFloatToDate.dart';

import '../data/datasetField.dart';

class ListComponent extends StatefulWidget {
  List <DataSet> dataHome;
  ListComponent({Key? key, required this.dataHome}) : super(key: key);

  @override
  State<ListComponent> createState() => _ListComponentState(dataHome);
}
class _ListComponentState extends State<ListComponent> {

  final List<DataSet> dataHome;
  _ListComponentState(this.dataHome);

  int sortName = 1;
  int sortStatus = 1;
  bool isAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HorizontalDataTable(
        leftHandSideColumnWidth: 50,
        rightHandSideColumnWidth: 1105,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: dataHome.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
    );
  }

  //----------------Ten Tất cả Cột--------------------
  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('STT', 50),
      //----------------Tieu đe va su kien Ontap -> sx theo Ngay va Thoi gian--------------------
      GestureDetector(
        child: _getTitleItemWidget('Ngày '+( 1 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 1;
            if (isAscending ) dataHome.sort((a,b)=> a.date!.compareTo(b.date!));
            else dataHome.sort((a,b)=> b.date!.compareTo(a.date!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Giờ '+( 2 == sortName? (isAscending?'↓':'↑'):''), 75),
        onTap: (){
          setState(() {
            sortName = 2;
            if (isAscending ) dataHome.sort((a,b)=> a.time!.compareTo(b.time!));
            else dataHome.sort((a,b)=> b.time!.compareTo(a.time!));
            isAscending = !isAscending;
          });
        },
      ),
      //----------------Tieu đe va su kien Ontap -> sx theo Nhiet độ--------------------
      GestureDetector(
        child: _getTitleItemWidget('Nhiệt độ 1 '+( 3 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 3;
            if (isAscending ) dataHome.sort((a,b)=> a.temperature1!.compareTo(b.temperature1!));
            else dataHome.sort((a,b)=> b.temperature1!.compareTo(a.temperature1!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Nhiệt độ 2 '+( 4 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 4;
            if (isAscending ) dataHome.sort((a,b)=> a.temperature2!.compareTo(b.temperature2!));
            else dataHome.sort((a,b)=> b.temperature2!.compareTo(a.temperature2!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Nhiệt độ 3 '+( 5 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 5;
            if (isAscending ) dataHome.sort((a,b)=> a.temperature3!.compareTo(b.temperature3!));
            else dataHome.sort((a,b)=> b.temperature3!.compareTo(a.temperature3!));
            isAscending = !isAscending;
          });
        },
      ),
      //----------------Tieu đe va su kien Ontap -> sx theo Độ ẩm--------------------
      GestureDetector(
        child: _getTitleItemWidget('Độ ẩm 1 '+( 6 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 6;
            if (isAscending ) dataHome.sort((a,b)=> a.humidity1!.compareTo(b.humidity1!));
            else dataHome.sort((a,b)=> b.humidity1!.compareTo(a.humidity1!));
            isAscending = !isAscending;
          });
        },
      ),

      GestureDetector(
        child: _getTitleItemWidget('Độ ẩm 2 '+( 7 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 7;
            if (isAscending ) dataHome.sort((a,b)=> a.humidity2!.compareTo(b.humidity2!));
            else dataHome.sort((a,b)=> b.humidity2!.compareTo(a.humidity2!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Độ ẩm 3 '+( 8 == sortName? (isAscending?'↓':'↑'):''), 100),
        onTap: (){
          setState(() {
            sortName = 8;
            if (isAscending ) dataHome.sort((a,b)=> a.humidity3!.compareTo(b.humidity3!));
            else dataHome.sort((a,b)=> b.humidity3!.compareTo(a.humidity3!));
            isAscending = !isAscending;
          });
        },
      ),
      //----------------Tieu đe va su kien Ontap -> sx theo Ánh sáng --------------------
      GestureDetector(
        child: _getTitleItemWidget('Ánh sáng 1 '+( 9 == sortName? (isAscending?'↓':'↑'):''), 110),
        onTap: (){
          setState(() {
            sortName = 9;
            if (isAscending ) dataHome.sort((a,b)=> a.light1!.compareTo(b.light1!));
            else dataHome.sort((a,b)=> b.light1!.compareTo(a.light1!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Ánh sáng 2 '+( 10 == sortName? (isAscending?'↓':'↑'):''), 110),
        onTap: (){
          setState(() {
            sortName = 10;
            if (isAscending ) dataHome.sort((a,b)=> a.light2!.compareTo(b.light2!));
            else dataHome.sort((a,b)=> b.light2!.compareTo(a.light2!));
            isAscending = !isAscending;
          });
        },
      ),
      GestureDetector(
        child: _getTitleItemWidget('Ánh sáng 3 '+( 11 == sortName? (isAscending?'↓':'↑'):''), 110),
        onTap: (){
          setState(() {
            sortName = 11;
            if (isAscending ) dataHome.sort((a,b)=> a.light3!.compareTo(b.light3!));
            else dataHome.sort((a,b)=> b.light3!.compareTo(a.light3!));
            isAscending = !isAscending;
          });
        },
      ),
    ];
  }

  //----------------Hiển thị 1 cột --------------------
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  //---------------Cột Số thứ tự---------------------
  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(index.toString()),
      width: 50,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  //--------------Các cột dữ liệu ----------------------
  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(Changes().DateChange(dataHome[index].date!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().getTime(dataHome[index].time!)),
          width: 75,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().Div10(dataHome[index].temperature1!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().Div10(dataHome[index].temperature2!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().Div10(dataHome[index].temperature3!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),

        Container(
          child: Text(Changes().Div10(dataHome[index].humidity1!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().Div10(dataHome[index].humidity2!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(Changes().Div10(dataHome[index].humidity3!)),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),

        Container(
          child: Text(dataHome[index].light1!.toString()),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(dataHome[index].light2!.toString()),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(dataHome[index].light3!.toString()),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
