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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( title : Text("App bar")),
        body: SizedBox(
          width: 50, height: 50,
          child: Text(token),
        )
      )
    );
  }

  @override
  void initState() {
    setState(() {
      getToken().then((result) {
        token = result;
      });
    });
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token") ?? "";

    return token;
  }
}
