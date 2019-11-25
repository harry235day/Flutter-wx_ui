import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/people/PeopleBean.dart';

class people_item extends StatefulWidget {
  PeopleBean bean;
  String oldKey;

  people_item(this.bean, this.oldKey);

  @override
  _people_itemState createState() => _people_itemState();
}

class _people_itemState extends State<people_item> {
  @override
  Widget build(BuildContext context) {
    return Container(child: getHead(context, widget.bean));
  }

  getHead(BuildContext context, PeopleBean bean) {
    bool isOffsate = isOffstage(bean.index);
    return Column(
      children: <Widget>[
        Offstage(
          offstage:isOffsate ,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 18),
                  color: GlobalConfig.colorbg,
                  height: 30,
                  child: Text(
                    bean.index,
                    style: TextStyle(color: Colors.black38, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              height: 69,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                      color: bean.isHead ? bean.color : Colors.transparent,
                      child: bean.isHead
                          ? SizedBox.fromSize(
                              child: Icon(
                                bean.icon,
                                color: Colors.white,
                              ),
                              size: Size(49, 49),
                            )
                          : Image.network(
                              bean.url,
                              width: 49,
                              height: 49,
                              fit: BoxFit.cover,
                            )),
                  Text(
                    bean.name,
                    style: TextStyle(color: Colors.black87),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 85),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: GlobalConfig.colorLine, width: 1.0),
              )),
            )
          ],
        ),
      ],
    );
  }

  isOffstage(String key) {
    if (key.isEmpty) {
      return true;
    }
    if (key != widget.oldKey) {
      return false;
    }
    return true;
  }
}
