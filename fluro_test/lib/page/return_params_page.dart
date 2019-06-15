import 'package:fluro_test/config/NavigatorUtil.dart';
import 'package:fluro_test/model/Person.dart';
import 'package:flutter/material.dart';

class ReturnParamsPage extends StatefulWidget {
  @override
  _ReturnParamsPageState createState() => _ReturnParamsPageState();
}

class _ReturnParamsPageState extends State<ReturnParamsPage> {
  @override
  Widget build(BuildContext context) {
    Person person = new Person(name: "returnName", age: 23, sex: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('返回，并且返回string'),
              onPressed: () {
                NavigatorUtil.goBackWithParams(context, "我是返回值哦");
              },
            ),
          ),
          RaisedButton(
            child: Text('返回，并且返回int'),
            onPressed: () {
              NavigatorUtil.goBackWithParams(context, 12);
            },
          ),
          RaisedButton(
            child: Text('返回，并且返回double'),
            onPressed: () {
              NavigatorUtil.goBackWithParams(context, 3.1415926);
            },
          ),
          RaisedButton(
            child: Text('返回，并且返回bool'),
            onPressed: () {
              NavigatorUtil.goBackWithParams(context, true);
            },
          ),
          RaisedButton(
            child: Text('返回，并且返回自定义类型'),
            onPressed: () {
              NavigatorUtil.goBackWithParams(context, person);
            },
          )
        ],
      ),
    );
  }
}
