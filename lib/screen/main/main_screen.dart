import 'package:ballapp/screen/main/widgets/main_widget_1.dart';
import 'package:ballapp/screen/main/widgets/widget2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/main_appbar.dart';
import 'widgets/search_box.dart';


class MainScreen extends StatefulWidget {

  const MainScreen({Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AutomaticKeepAliveClientMixin<MainScreen> {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  String token = "";

  @override
  void initState() {
    super.initState();

    setState(() {
      getToken().then((result) {
        token = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
              centerTitle: true,
              elevation : 0.0,
              // leading: IconButton(
              //   alignment : Alignment.centerLeft,
              //   padding: EdgeInsets.all(8.0),
              //   icon: Icon(Icons.menu),
              //   onPressed: (){},
              // ),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              title : MainAppbarWidget(),
          )
        ),
        body: Container(
          child: Column(
            children: [
              MainSearchBoxWidget(),
              Row(
                children: [
                  LaundryBox(),
                  LaundryBox(),
                  LaundryBox2(),
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
