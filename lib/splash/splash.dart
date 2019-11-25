import 'package:flutter/material.dart';
import 'package:wxchat/home/home.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000)).then((_) {
      print("push");
//      Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return home();
      }), (route) => route == null);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: Image.asset(
        "images/splash.jpg",
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    ));
  }
}
