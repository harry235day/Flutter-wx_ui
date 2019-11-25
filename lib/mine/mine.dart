import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wxchat/common/GlobalConfig.dart';
import 'package:wxchat/found/found_item.dart';
import 'package:wxchat/found/line.dart';
import 'package:wxchat/found/linebg.dart';

class mine extends StatefulWidget {
  @override
  _mineState createState() => _mineState();
}

class _mineState extends State<mine> {
  var avater =
      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=288969198,3331310267&fm=26&gp=0.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "我的",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              height: 59,
              margin: const EdgeInsets.all(18),
              child: Row(
//                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    radius: 29.0,
                    child: Image.network(
                      avater,
                      fit: BoxFit.cover,
                      width: 59,
                      height: 59,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 8)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "离歌难言一曲眷恋恋曲眷恋言曲眷恋恋言曲眷恋恋言曲眷恋",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
//                        direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "微信号：",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "啼音昆仑遍",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.camera_enhance,
                              color: Colors.grey,
                            ),
                            Padding(padding: const EdgeInsets.only(left: 5)),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 18,
                  )
                ],
              ),
            ),
            linebg(),
            found_item(Icons.payment, "支付"),
            linebg(),
            found_item(Icons.save, "收藏"),
            line(),
            found_item(Icons.album, "相册"),
            line(),
            found_item(Icons.monetization_on, "卡包"),
            line(),
            found_item(Icons.insert_emoticon, "表情"),
            linebg(),
            found_item(Icons.settings, "设置"),
          ],
        ),
      ),
    );
  }
}
