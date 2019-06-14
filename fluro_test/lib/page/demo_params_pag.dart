import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluro_test/model/Person.dart';
import 'package:fluro_test/utils/fluro_convert_util.dart';

class DemoParamsPage extends StatefulWidget {
  final String name;
  final int age;
  final bool sex;
  final String personJson;

  DemoParamsPage({this.name, this.age,this.sex,this.personJson});

  @override
  _DemoParamsPageState createState() => _DemoParamsPageState();
}

class _DemoParamsPageState extends State<DemoParamsPage> {
  @override
  Widget build(BuildContext context) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(widget.name).forEach(list.add);
    final String value = Utf8Decoder().convert(list);

    int mAge = widget.age;
    bool mSex = widget.sex;



    if(mSex){
      print("mSex :  true");
    }else{
      print("mSex :  false");
    }


//    Person person = Person.fromJson(json.decode(widget.personJson));

    var list2 = List<int>();

    ///字符串解码
    jsonDecode(widget.personJson).forEach(list2.add);
    final String value2 = Utf8Decoder().convert(list2);
    Person person = Person.fromJson(json.decode(value2));

    print(person.name);
    print(person.age);
    print(person.sex);

    return Scaffold(
      body: Center(
        child: Text('$value$mAge$mSex'),
      ),
    );
  }
}
