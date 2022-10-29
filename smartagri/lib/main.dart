import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:smartagri/ManagerScreen.dart';
import 'package:smartagri/Screen/LoginScreen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



import 'data/data_sheet_api.dart';

Future <void> main() async {


  bool result = await InternetConnectionChecker().hasConnection;
  if(result == true) {
    print('YAY! Connect internet success!');
    runApp(const MyApp());
    await DataSheetApi.init().whenComplete(() => print('Init Success'));

  } else {
    print('No internet :( Reason:');
    runApp(const NoConnect());
    // print(InternetConnectionChecker().lastTryResults);
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NTU SmartAgri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class NoConnect extends StatelessWidget {
  const NoConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NTU SmartAgri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NoConnectInternet(),
    );
  }
}
class NoConnectInternet extends StatelessWidget {
  const NoConnectInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off ,size: 150,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Không có kết nối Internet !!!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              // Text('Vui lòng kiểm tra lại kết nối và thử lại')
            ],
          ),
        ),
      ),
    );
  }
}


