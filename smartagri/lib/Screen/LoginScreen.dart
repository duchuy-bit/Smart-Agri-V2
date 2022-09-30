
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:smartagri/ManagerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // final widthScreen = ;
  // Future<void> checkInternet() async {
  //   bool result = await InternetConnectionChecker().hasConnection;
  //   if(result == true) {
  //     print('YAY! Free cute dog pics!');
  //   } else {
  //     print('No internet :( Reason:');
  //     print(InternetConnectionChecker());
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // child: ManagerScreen
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Hello
                // Icon(Icons.admin_panel_settings ,
                //   size: 100,),
                Image.asset('assets/images/smartAgri.png',
                    width: MediaQuery.of(context).size.width *5/10,
                    height: MediaQuery.of(context).size.width *5/10,
                    fit: BoxFit.fill
                ),

                SizedBox(height: 25,),

                Text('Login Page!',style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 30),),

                SizedBox(height: 20,),

                // Text('',style: TextStyle(
                //     fontWeight: FontWeight.bold,fontSize: 20),),

                SizedBox(height: 25,),
                //email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),
                //Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),
                //Button sign in
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: ()=>{
                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_) => ManagerScreen()), (route) => false)

                    // Navigator.replace(context, oldRoute: oldRoute, newRoute: newRoute)
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                          child: Text('Sign In',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),
                //forgot password

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forgot password? ',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('Get Password',style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
