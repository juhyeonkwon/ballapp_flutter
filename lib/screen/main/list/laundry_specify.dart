import 'package:flutter/material.dart';

class LaundrySpec extends StatefulWidget {
  const LaundrySpec({Key? key}) : super(key: key);

  @override
  State<LaundrySpec> createState() => _LaundrySpecState();
}

class _LaundrySpecState extends State<LaundrySpec> {



  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      foregroundColor: Colors.black26,
      backgroundColor: Colors.white,
    ),
    body: ElevatedButton(
      child: Text("버튼"),
      onPressed: (){
      },
    ),
  );

}
}
