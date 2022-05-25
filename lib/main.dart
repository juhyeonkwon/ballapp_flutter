import 'package:ballapp/screen/learn.dart';
import 'package:flutter/material.dart';
import 'navigation/bottom_navigation.dart';
import 'navigation/main_navigation.dart';
import 'screen/splash.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '2895d94e0ebac80694819ba40ec4717c');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Balapp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: _title,
      home: Splash()
    );
  }
}

