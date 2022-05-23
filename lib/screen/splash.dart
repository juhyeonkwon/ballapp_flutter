import 'dart:async';

import 'package:ballapp/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_screen.dart';
import 'main/main_screen.dart';
import '../navigation/bottom_navigation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, context }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;


    return WillPopScope(child: Scaffold(
      body: Container(
        child: Scaffold(
          body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Center(child: Text("빨랩", style: TextStyle(color: Colors.white),)),
          ),
        ),
      ),
    ), onWillPop: () async => false,);
  }

  @override
  void initState() {


    Timer(Duration(milliseconds: 1500), () {
      getToken().then((token)  {
        if(token == "") {
          print("로그인 안되어있슴");
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LoginScreen()
            )
        );
      } else {
          print("${token} 로그인 되어잇슴");
        Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainNavigation()
        )
        );
        }

      });

    });
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token") ?? "";

    return token;
  }
}
