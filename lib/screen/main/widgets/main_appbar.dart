import 'package:ballapp/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class MainAppbarWidget extends StatefulWidget {
  const MainAppbarWidget({Key? key}) : super(key: key);

  @override
  State<MainAppbarWidget> createState() => _MainAppbarWidgetState();
}

class _MainAppbarWidgetState extends State<MainAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      showModalBottomSheet(
          isScrollControlled:true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          useRootNavigator: true,
          context: context, builder: (BuildContext context) {
        return ModalAddressWidget();
      });
    }, child:  Wrap(
        children: [
            Text("진주시 진주대로 501", style: TextStyle(color: Colors.white),),
            Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ],
      ),
    );
  }
}

class ModalAddressWidget extends StatefulWidget {
  const ModalAddressWidget({Key? key}) : super(key: key);

  @override
  State<ModalAddressWidget> createState() => _ModalAddressWidgetState();
}

class _ModalAddressWidgetState extends State<ModalAddressWidget> {

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height * 0.9;

    return Container(
      height: height,
      child: Text("모달 시트 창입니다람쥐요"),
    );
  }
}
