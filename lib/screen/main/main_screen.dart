import 'package:ballapp/screen/main/widgets/main_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  String token = "";

  @override
  void initState() {
    super.initState();

    print("왜호출이안되나요");

    setState(() {
      getToken().then((result) {
        print("여기로 안오나요");

        token = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){},
            ),
            title : Text("App bar")),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                width: 50, height: 50,
                child: Text(token),
              ),
              Row(
                children: [
                  LaundryBox(),
                  LaundryBox(),
                ],
              ),

            ],
          ),
        )
      )
    );
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token") ?? "";

    return token;
  }
}
