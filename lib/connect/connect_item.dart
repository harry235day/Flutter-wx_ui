import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/connect/connectBean.dart';

class connect_item extends StatelessWidget {
  connectBean bean;

  connect_item(this.bean);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(bean.title);
      },
      child: Container(
        height: 69,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 18.0, right: 18.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: GlobalConfig.colorLine, width: 1),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getItemImage(bean.url),
            Padding(padding: const EdgeInsets.only(right: 13)),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bean.title,
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 6)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          bean.subtitle,
                          style: TextStyle(color: Colors.black38, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 49,
              margin: const EdgeInsets.only(right: 13),
              child: Text(
                bean.time,
                style: TextStyle(color: Colors.black12, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getItemImage(var url) {
    if (null != url) {
      return Image.network(
        url,
        width: 49,
        height: 49,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "images/icon_wx_chat_selected.png",
        width: 49,
        height: 49,
        fit: BoxFit.cover,
      );
    }
  }
}
