import 'package:flutter/material.dart';

import 'bottom_navigation.dart';
import '../screen/main/list/laundry_screen.dart';

final GlobalKey<NavigatorState> mainKey = GlobalKey();

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}


class _MainNavigationState extends State<MainNavigation> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      navigatorKey: mainKey,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const BottomNavigation(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/main/list': (context) => const LaundryList(),
      },
    );
  }
}

Widget slide(context, animation, secondaryAnimation, child) {
  var begin =  Offset(1, 0.0);
  var end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}