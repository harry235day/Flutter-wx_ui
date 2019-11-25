import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wxchat/common/GlobalConfig.dart';

class found_item extends StatelessWidget {
  IconData icon;
  var name;
  VoidCallback onTap;

  found_item(this.icon, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 59,
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: GlobalConfig.colorIcon,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                name,
                style: TextStyle(color: GlobalConfig.colorPrimary, fontSize: 16),
              ),
            ),
          ),
//          Expanded(flex: 1, child: Container(alignment: Alignment.topRight,)),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
