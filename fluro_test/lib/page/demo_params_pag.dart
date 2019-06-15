import 'package:fluro_test/config/NavigatorUtil.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluro_test/model/Person.dart';
import 'package:fluro_test/utils/fluro_convert_util.dart';

class DemoParamsPage extends StatefulWidget {
  final String name;
  final int age;
  final double score;
  final bool sex;
  final String personJson;

  DemoParamsPage({this.name, this.age, this.score, this.sex, this.personJson});

  @override
  _DemoParamsPageState createState() => _DemoParamsPageState();
}

class _DemoParamsPageState extends State<DemoParamsPage> {
  @override
  Widget build(BuildContext context) {
    String mName = FluroConvertUtils.fluroCnParamsDecode(widget.name);

    Person person =
        Person.fromJson(FluroConvertUtils.string2map(widget.personJson));
    print(person.name);
    print(person.age);
    print(person.sex);

    Map<String, dynamic> data = FluroConvertUtils.string2map(widget.personJson);
    print(data["name"]);
    print(data["age"]);
    print(data["sex"]);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('name：$mName'),
            Text('age：${widget.age}'),
            Text('score：${widget.score}'),
            Text('sex：${widget.sex}'),
            Text('Person:${person.toJson().toString()}'),
            RaisedButton(
              child: Text('返回'),
              onPressed: () {
                NavigatorUtil.goBack(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
