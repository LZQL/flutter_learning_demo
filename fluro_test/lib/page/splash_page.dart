import 'package:fluro_test/config/NavigatorUtil.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fluro_test/config/application.dart';
import 'package:fluro_test/config/routes.dart';

class SplashPag extends StatefulWidget {
  @override
  _SplashPagState createState() => _SplashPagState();
}

class _SplashPagState extends State<SplashPag> {

  @override
  void initState() {
//    Future.delayed(Duration(seconds: 5),(){
//      NavigatorUtil.goHomePage(context);
//    });

    Observable.timer(0, Duration(seconds: 2)).listen((_){
      NavigatorUtil.goHomePage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Text('我是欢迎页面'),
        ),
      ),
    );
  }
}
