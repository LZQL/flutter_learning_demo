import 'package:flutter/material.dart';
import 'package:status_about_test_01/model/menu_item_model.dart';
import 'package:status_about_test_01/utils/navigator_util.dart';

/// ListView Item 布局
class MenuItem extends StatelessWidget {
  final MenuItemModel data;

  MenuItem(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => NavigatorUtil.pushPage(context, data.page),
        child: Container(
          height: 80,
          margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      data.name,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
