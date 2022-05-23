import 'package:ballapp/navigation/main_navigation.dart';
import 'package:ballapp/screen/main/list/laundry_screen.dart';
import 'package:flutter/material.dart';

class LaundryBox extends StatelessWidget {
  const LaundryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.4;
    double height = 100;
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        child: Text("세탁"),
        onPressed: (){
          // mainKey.currentState?.pushNamed('/main/list');
          mainKey.currentState?.push(
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
