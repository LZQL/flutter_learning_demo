import 'package:flutter/material.dart';
import 'package:status_about_test_01/model/menu_item_model.dart';
import 'package:status_about_test_01/page/menu_item.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget01.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_const_01.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_const_02.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_const_03.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_out_01.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_out_02.dart';
import 'package:status_about_test_01/page/inheritedwidget/inheritedwidget_out_03.dart';
import 'package:status_about_test_01/page/inheritedwidget/ancestor01.dart';
import 'package:status_about_test_01/page/inheritedwidget/ancestor02.dart';


final List<MenuItemModel> _itemList = [
  MenuItemModel(name: "AncestorWidgetOfExactType01演示", page: MyAncestorTree01()),
  MenuItemModel(name: "AncestorWidgetOfExactType02演示", page: MyAncestorTree02()),
//  MenuItemModel(name: "AncestorWidgetOfExactType演示", page: TopPage()),
  MenuItemModel(name: "InheritedWidget演示01", page: InheritedWidgetTest01()),
  MenuItemModel(name: "InheritedWidget const 01 演示", page: InheritedWidgetConst01()),
  MenuItemModel(name: "InheritedWidget const 02 演示", page: InheritedWidgetConst02()),
  MenuItemModel(name: "InheritedWidget const 03 演示", page: InheritedWidgetConst03()),
  MenuItemModel(name: "InheritedWidget out 01 演示", page: InheritedWidgetOut01()),
  MenuItemModel(name: "InheritedWidget out 02 演示", page: InheritedWidgetOut02()),
  MenuItemModel(name: "InheritedWidget out 03 演示", page: InheritedWidgetOut03()),
];


class MenuInheritedWidgetPage extends StatefulWidget {
  @override
  _MenuInheritedWidgetPageState createState() =>
      _MenuInheritedWidgetPageState();
}

class _MenuInheritedWidgetPageState extends State<MenuInheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('inheritedwidget'),),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.white, Theme.of(context).primaryColor])),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MenuItem(_itemList[index]);
                },
                itemCount: _itemList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}