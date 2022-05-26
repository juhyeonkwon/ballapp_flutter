import 'package:ballapp/navigation/main_navigation.dart';
import 'package:ballapp/screen/main/search/search_appbar.dart';
import 'package:flutter/material.dart';


class MainSearchScreen extends StatefulWidget {
  const MainSearchScreen({Key? key}) : super(key: key);

  @override
  State<MainSearchScreen> createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _MainSearchScreenState() {
    _filter.addListener(() {
      _searchText = _filter.text;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            leadingWidth: 34, // <-- Use this
            titleSpacing: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            leading: IconButton(
              alignment : Alignment.centerLeft,
              padding: EdgeInsets.only(left : 8.0),
              icon: Icon(Icons.arrow_back, size: 24,),
              onPressed: (){
                mainKey.currentState?.pop();
              },
            ),
            centerTitle: false,
            elevation : 0.0,
            title : SearchAppbarWidget(focusNode : focusNode, filter : _filter, searchText : _searchText, clearSearch : clearSearch),
          )
      ),
      body: focusNode.hasFocus ? Container(
        decoration: BoxDecoration(
          color: Colors.black38
        ),
      ) : Text("ㅇㅅㅇㅅㅇ"),
    );
  }


  void clearSearch() {
    this.focusNode.unfocus();
    this._searchText = "";
    this._filter.text = "";
  }
}
