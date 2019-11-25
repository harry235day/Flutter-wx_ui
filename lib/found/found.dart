import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/found/found_item.dart';
import 'package:wxchat/found/line.dart';
import 'package:wxchat/found/linebg.dart';

class found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "发现",
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
        child: ListView(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  print("AAAA");
                  Navigator.of(context).pushNamed("zone");
                }, child: found_item(Icons.camera, "朋友圈")),
            linebg(),
            found_item(Icons.crop_free, "扫一扫"),
            line(),
            found_item(Icons.screen_rotation, "摇一摇"),
            linebg(),
            found_item(Icons.insert_emoticon, "看一看"),
            line(),
            found_item(Icons.content_copy, "搜一搜"),
            linebg(),
            found_item(Icons.people, "附近的人"),
            linebg(),
            found_item(Icons.shopping_cart, "购物"),
            line(),
            found_item(Icons.games, "游戏"),
            linebg(),
            found_item(Icons.ac_unit, "小程序"),
          ],
        ),
      ),
    );
  }

//  "朋友圈   扫一扫 摇一摇 看一看 搜一搜    附近的人   购物 游戏   小程序";

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
