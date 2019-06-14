import 'package:flutter/material.dart';
import 'package:fluro_test/config/application.dart';
import 'package:fluro_test/config/routes.dart';
import 'package:fluro_test/model/Person.dart';
import 'package:fluro_test/utils/fluro_convert_util.dart';

import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var json = jsonEncode(Utf8Encoder().convert('来自第一个界面'));
    int age = 14;
    bool sex = true;

    Person person = new Person(name: '我操', age: 17,sex: true);
    String personJson = jsonEncode(Utf8Encoder().convert(jsonEncode(person))) ;
//    String personJson = jsonEncode(person);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('这是主页')),
          RaisedButton(
            child: Text('跳转'),
            onPressed: () {
              Application.router.navigateTo(
                  context, Routes.demoParams + "?name=$json&age=$age&sex=$sex&personjson=$personJson");
            },
          )
        ],
      ),
    );
  }
}
