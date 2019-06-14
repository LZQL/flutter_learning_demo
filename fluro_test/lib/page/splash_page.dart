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
//      debugPrint('fuck you ');
//    });

    Observable.timer(0, Duration(seconds: 2)).listen((_){
      debugPrint('fuck you ');
      Application.router.navigateTo(context, Routes.home,replace: true);
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
