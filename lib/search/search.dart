import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(child: AppBar(), preferredSize: Size(0, 0)),
      body: Container(
        child: Column(
          children: <Widget>[
            getTabSearch(context),
            Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Text(
                "搜索指定内容",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 30)),
            getTabText("朋友圈", "文章", "公众号"),
            Padding(padding: const EdgeInsets.only(top: 30)),
            getTabText("小程序", "音乐", "表情")
          ],
        ),
      ),
    );
  }

  Widget getTabSearch(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              child: TextField(
                autofocus: true,
                focusNode: _focusNode,
                style: TextStyle(color: Colors.black87, fontSize: 16),
                decoration: InputDecoration(
                  hintText: "搜索",
                  hintStyle: TextStyle(color: Colors.grey),
//                  border: InputBorder(borderSide: BorderSide(color: Colors.black87)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FocusNode _focusNode = new FocusNode();

  _requestFocus() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  getTabText(var txt1, var txt2, var txt3) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          txt1,
          style: TextStyle(color: Colors.blue),
        ),
        Text(
          txt2,
          style: TextStyle(color: Colors.blue),
        ),
        Text(
          txt3,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
