import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/connect/connect_item.dart';
import 'package:wxchat/connect/connectApi.dart';

class connect extends StatefulWidget {
  @override
  _connectState createState() => _connectState();
}

class _connectState extends State<connect> {
  connectApi api = new connectApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "微信",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: GlobalConfig.colorPrimary,
        actions: <Widget>[
          GestureDetector(
            child: Image.asset(
              "images/icon_search.png",
              width: 24,
              height: 24,
            ),
            onTap: () {
              Navigator.of(context).pushNamed("search");
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23, right: 20),
            child: GestureDetector(
              onTap: () {
                _showMenu(context);
              },
              child: Image.asset(
                "images/icon_more.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return connect_item(api.connectList[index]);
          },
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: api.connectList.length,
        ),
      ),
    );
  }

  go(var index) {
    if (index == 0) {
    } else if (index == 1) {}
  }

  _showMenu(BuildContext context) {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(500, 80, 30, 0),
        items: <PopupMenuItem>[
          PopupMenuItem(
            value: "0",
            child: GestureDetector(
              onTap: () {
                clickMenu(0, context);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "发起群聊",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: "1",
            child: GestureDetector(
              onTap: () {
                clickMenu(1, context);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "添加朋友",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: "2",
            child: GestureDetector(
              onTap: () {
                clickMenu(2, context);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.payment,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "收付款",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: "3",
            child: GestureDetector(
              onTap: () {
                clickMenu(3, context);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.crop_free,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "扫一扫",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
          PopupMenuItem(
            value: "4",
            child: GestureDetector(
              onTap: () {
                clickMenu(4, context);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "意见反馈",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]);
  }

  clickMenu(var index, BuildContext context) {
    Navigator.of(context).pop();
    print(index);
  }
}
