import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/common/Touch_CallBack.dart';
import 'package:wxchat/people/peopleApi.dart';
import 'package:wxchat/people/people_item.dart';
import 'package:flutter/src/material/constants.dart';

class people extends StatefulWidget {
  @override
  _peopleState createState() => _peopleState();
}

class _peopleState extends State<people> {
  peopleApi _api = new peopleApi();

  VoidCallback callback;
  ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "通讯录",
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
          child: Stack(
            children: <Widget>[
              ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) {
                  return people_item(_api.peopleList[index],
                      index > 0 ? _api.peopleList[index - 1].index : "");
                },
                itemCount: _api.peopleList.length,
              ),
              Positioned(
                right: 0,
                top: 0,
                height: MediaQuery.of(context).size.height -
                    2 * kBottomNavigationBarHeight -
                    kTextTabBarHeight,
                child: Container(
                  width: 25,
                  alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Touch_CallBack(
                          Container(
                            alignment: Alignment.center,
                            height: 22,
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              _api.indexList[index],
                              style: TextStyle(color: Colors.grey),
                            ),
                          ), () {
                        onClick(_api.indexList[index]);
                      });
                    },
                    itemCount: _api.indexList.length,
                  ),
                ),
              )
            ],
          )),
    );
  }

  onClick(String key) {
    print(key);
    double index = jumpe(key);
    print(index);
    controller.animateTo(index * 69,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  jumpe(var key) {
    for (var i = 0; i < _api.peopleList.length; i++) {
      var value = _api.peopleList[i];
      var index = value.index;
      if (key == index) {
        return i * 1.0;
      }
    }
    return -1.0;
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
