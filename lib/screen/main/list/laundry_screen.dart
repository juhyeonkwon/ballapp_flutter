import 'package:ballapp/screen/main/list/laundry_specify.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../navigation/main_navigation.dart';

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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading : false,
            leadingWidth: 34, // <-- Use this
            titleSpacing: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            leading: IconButton(
              alignment : Alignment.centerLeft,
              padding: EdgeInsets.only(left : 8.0),
              icon: Icon(Icons.arrow_back, size: 24, color: Colors.black38,),
              onPressed: (){
                mainKey.currentState?.pop();
              },
            ),
            centerTitle: false,
            elevation : 0.0,
          )
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
    );

  }
}
