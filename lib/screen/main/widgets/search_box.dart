import 'package:ballapp/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

import '../search/main_search_screen.dart';

class MainSearchBoxWidget extends StatefulWidget {
  const MainSearchBoxWidget({Key? key}) : super(key: key);

  @override
  State<MainSearchBoxWidget> createState() => _MainSearchBoxWidgetState();
}

class _MainSearchBoxWidgetState extends State<MainSearchBoxWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0)),color: Colors.blue),
        child: Container(
          height: 35.0,
          child: TextButton(
            onPressed: (){
              mainKey.currentState?.push(
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => MainSearchScreen(),
                    transitionsBuilder: slide,
                    transitionDuration: const Duration(milliseconds: 150),
                    reverseTransitionDuration: const Duration(milliseconds: 150),
                  ));
              },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.black38, size: 22.0, ),
                Text("동네 주변 검색", style: TextStyle(color: Colors.black38, fontSize: 14.0))
              ],
            ),
          )
        )
      ),
    );
  }
}
