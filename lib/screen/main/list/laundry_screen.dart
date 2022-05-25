import 'package:ballapp/screen/main/list/laundry_specify.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryList extends StatefulWidget {
  const LaundryList({Key? key}) : super(key: key);

  @override
  State<LaundryList> createState() => _LaundryListState();
}

class _LaundryListState extends State<LaundryList> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black26,
        backgroundColor: Colors.white,
        title: Text("list"),
      ),
      body: ElevatedButton(
        child: Text("버튼"),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LaundrySpec()),
          );
        },
      ),
      bottomNavigationBar: Text("dtd"),
    );

  }
}
