import 'package:ballapp/navigation/main_navigation.dart';
import 'package:ballapp/screen/main/list/laundry_screen.dart';
import 'package:flutter/material.dart';

class LaundryBox2 extends StatelessWidget {
  const LaundryBox2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.3;
    double height = 100;
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        child: Text("세탁2"),
        onPressed: (){
          // mainKey.currentState?.pushNamed('/main/list');
          Navigator.push(context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => LaundryList(),
                transitionsBuilder: slide,
                transitionDuration: const Duration(milliseconds: 150),
                reverseTransitionDuration: const Duration(milliseconds: 150),
              ));
        },
      ),
    );
  }

  void navi() {}
}
