import 'package:ballapp/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

class SearchAppbarWidget extends StatefulWidget {
  final String searchText;
  final TextEditingController filter;
  final FocusNode focusNode;
  final clearSearch;
  const SearchAppbarWidget({Key? key, required this.filter, required this.searchText, required this.focusNode, required this.clearSearch}) : super(key: key);

  @override
  State<SearchAppbarWidget> createState() => _SearchAppbarWidgetState();
}

class _SearchAppbarWidgetState extends State<SearchAppbarWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10,),
      height: 32,
      child : TextField(
      controller: widget.filter,
        focusNode: widget.focusNode,
        style: TextStyle(
          fontSize: 14,
        ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.black12,
        filled: true,
          prefixIconConstraints:BoxConstraints(minWidth: 25),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5, right: 2),
            child: Icon(
              Icons.search,
              color: Colors.black38,
              size: 22,
            ),
          ),
        prefixIconColor: Colors.black38,
        hintText: "검색어를 입력해 주세요",
        hintStyle: TextStyle(fontSize:14),
        suffixIconConstraints: BoxConstraints(maxWidth: 28),
        suffixIcon: widget.focusNode.hasFocus ? IconButton(
          padding: const EdgeInsets.only(left: 0, right: 0),
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.cancel_rounded, size: 20, color: Colors.black38,),
          onPressed: (){
            widget.clearSearch();
          },
        ) : Container(
          width: 1,
        ),
      ),

    ),);
  }
}
