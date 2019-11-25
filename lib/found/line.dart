import 'package:flutter/material.dart';
import 'package:wxchat/common/GlobalConfig.dart';

class line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.only(left: 57),
      color: GlobalConfig.colorLine,
    );
  }
}
