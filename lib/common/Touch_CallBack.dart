import 'package:flutter/material.dart';
import 'package:wxchat/common/CallBack.dart';
import 'package:wxchat/common/GlobalConfig.dart';

class Touch_CallBack extends StatefulWidget {
  Widget child;
  VoidCallback onPress;

  Touch_CallBack(@required this.child, this.onPress);

  @override
  _Touch_CallBackState createState() => _Touch_CallBackState();
}

class _Touch_CallBackState extends State<Touch_CallBack> {
  Color defatucolor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defatucolor,
      child: GestureDetector(
        child: widget.child,
        onTap: widget.onPress,
        onPanDown: (_) {
          setState(() {
            defatucolor = Colors.grey;
          });
        },
        onPanCancel: () {
          setState(() {
            defatucolor = Colors.transparent;
          });
        },

      ),
    );
  }
}
