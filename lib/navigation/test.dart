import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> key =GlobalKey();
final GlobalKey<NavigatorState> key2 =GlobalKey();

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: key,
      home: Navigator(
        key: key2,
      ),
    );
  }
}