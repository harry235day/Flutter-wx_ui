import 'package:flutter/cupertino.dart';

class PeopleBean {
  var name;
  var url;
  var index;
  var isHead;
  IconData icon;
  Color color;

  PeopleBean(this.name, this.isHead, this.index, this.icon, this.color, this.url);
}
