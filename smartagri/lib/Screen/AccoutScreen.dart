import 'package:flutter/material.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  int index =1;
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Copy(),
            MenuContainer(),

            // MenuSetting(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: OneItem(),
            // ),
            // TestStack(),
            ElevatedButton(onPressed: (){
              setState(() {
                index  = 1 ;print(index.toString());
                _visible = !_visible;
                print(_visible);
              });
            }, child: Text('Item 1')),
            ElevatedButton(onPressed: (){
              setState(() {
                index  = 2 ;print(index.toString());
                // _visible = !_visible;
                // print(_visible);
              });
            }, child: Text('Item 2')),
            ElevatedButton(onPressed: (){
              setState(() {
                index  = 3 ;
                // _visible = !_visible;
                // print(_visible);
                print(index.toString());
              });
            }, child: Text('Item 3'))
          ],
        ),
      )
    );
  }
  bool selected = true;

  Widget Copy()=>Center(
    child: Container(
      width: 250.0,
      height: 250.0,
      color: Colors.red,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              width: 250.0,
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          AnimatedAlign(
              alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: Text('Alooo')
          ),

        ],
      )
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
    // width: MediaQuery.of(context).size.width/3,
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
            child: Text("Hiện tại",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("KV-1:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red)),
              Text("11",style: TextStyle(fontSize: 16)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2,bottom: 2),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("KV-2:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue)),
                Text('123',style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("KV-3:  ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green)),
              Text('321',style: TextStyle(fontSize: 16),),
            ],
          )
        ],
      ),
    ),
  );

  Widget MenuBackground()=>Container(
    width: 120,
    height: 200,
    decoration: BoxDecoration(color: Colors.blue),
    child: Column(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              index =1;
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
              index =2;
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
              index =3;
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
      ],
    ),
  );

  Widget MenuAnimation()=>AnimatedAlign(
    duration: Duration(milliseconds: 1000),
    alignment: index == 1? AlignmentDirectional.topCenter:
      index == 2? Alignment.center
          : AlignmentDirectional.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:10,bottom: 10,left: 16,right: 16),
        child: Row(
          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nhiệt độ ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
            Icon(Icons.arrow_right_rounded, color: Colors.white),
          ],
        ),
      ),
    ),
  );

  Widget MenuSetting()=>Container(
    width: 160,
    height: 200,
    // decoration: BoxDecoration(color: Colors.blue),
    // duration: Duration(milliseconds: 2000),
    // curve: Curves.fastOutSlowIn,
    // alignment: index == 1? AlignmentDirectional.topCenter:
    //   index == 2? Alignment.center: AlignmentDirectional.bottomCenter,
    // width: MediaQuery.of(context).size.width */5,
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
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          MenuBackground(),
          MenuAnimation(),
        ],
      ),
    ),
    );

}
