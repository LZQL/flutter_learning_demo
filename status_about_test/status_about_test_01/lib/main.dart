import 'package:flutter/material.dart';
import 'package:status_about_test_01/model/menu_item_model.dart';
import 'package:status_about_test_01/page/menu_item.dart';
import 'package:status_about_test_01/page/inheritedwidget/menu_inherited_widget.dart';

final List<MenuItemModel> _itemList = [
  MenuItemModel(name: "InheritedWidget", page: MenuInheritedWidgetPage()),
//  MenuItemModel(name: "GlobalKey通信", page: GlobalKeyCommunication()),
//  MenuItemModel(name: "ValueNotifier通信", page: ValueNotifierCommunication()),
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '数据共享，通信，状态管理 Demo 01',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuStatusViewPage(),
    );
  }
}

class MenuStatusViewPage extends StatefulWidget {
  @override
  _MenuStatusViewPageState createState() =>
      _MenuStatusViewPageState();
}

class _MenuStatusViewPageState extends State<MenuStatusViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数据共享，通信，状态管理 Demo 01'),),
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
