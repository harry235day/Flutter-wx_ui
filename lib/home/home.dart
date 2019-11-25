import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wxchat/connect/connect.dart';
import 'package:wxchat/found/found.dart';
import 'package:wxchat/mine/mine.dart';
import 'package:wxchat/people/people.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: getTabHome(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabImage(0), title: getTabText(0)),
          BottomNavigationBarItem(icon: getTabImage(1), title: getTabText(1)),
          BottomNavigationBarItem(icon: getTabImage(2), title: getTabText(2)),
          BottomNavigationBarItem(icon: getTabImage(3), title: getTabText(3)),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
            print(_index);
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
      ),
    );
  }

  init() {
     images = const [
      ["images/icon_wx_chat_unselect.png", "images/icon_wx_chat_selected.png"],
      ["images/icon_connect_unselect.png", "images/icon_connect_selected.png"],
      ["images/icon_found_unselect.png", "images/icon_found_selected.png"],
      ["images/icon_mine_unselect.png", "images/icon_mine_selected.png"],
    ];

     titles = const ["微信", "通讯录", "发现", "我的"];
  }

  var images = const [
    ["images/icon_wx_chat_unselect.png", "images/icon_wx_chat_selected.png"],
    ["images/icon_connect_unselect.png", "images/icon_connect_selected.png"],
    ["images/icon_found_unselect.png", "images/icon_found_selected.png"],
    ["images/icon_mine_unselect.png", "images/icon_mine_selected.png"],
  ];

  var titles = const ["微信", "通讯录", "发现", "我的"];

  Widget getTabImage(var index) {
    var image = images[index];
    if (_index == index) {
      return Image.asset(
        image[1],
        fit: BoxFit.cover,
        width: 24.0,
        height: 24.0,
      );
    } else {
      return Image.asset(image[0],
          fit: BoxFit.cover, width: 24.0, height: 24.0);
    }
  }

  Widget getTabText(var index) {
    var texts = titles[index];
    if (_index == index) {
      return Text(
        texts,
//        style: TextStyle(color: Color.fromARGB(1, 26, 250, 41), fontSize: 14),
        style: TextStyle(color: Colors.greenAccent, fontSize: 14,fontWeight: FontWeight.w500),
      );
    } else {
      return Text(
        texts,
//        style: TextStyle(color: Color.fromARGB(1, 44, 44, 44), fontSize: 14),
        style: TextStyle(color: Colors.black87, fontSize: 14,fontWeight: FontWeight.w500),
      );
    }
  }

  Widget getTabHome(){
    switch(_index){
      case 0:
        return connect();
      case 1:
        return people();
      case 2:
        return found();
      case 3:
        return mine();
    }
  }
}
