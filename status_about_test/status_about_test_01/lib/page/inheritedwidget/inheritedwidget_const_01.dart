import 'package:flutter/material.dart';

/// 使用 const
/// Widget A ，FlatButton rebuild, Widget B  no rebuild
class InheritedWidgetConst01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetConst01State();
  }
}

class InheritedWidgetConst01State extends State<InheritedWidgetConst01> {
  int tmpData = 0;



  @override
  Widget build(BuildContext context) {
    print('InheritedWidgetTest02 build');
    return Scaffold(
      body: Center(
        child: ShareInherited(
          data: tmpData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WidgetA(),
              const WidgetB(),
              FlatButton(
                child: Text("Click me"),
                onPressed: () {
                  setState(() {
                    print('onPressed');
                    tmpData += 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareInherited extends InheritedWidget {
  final int data;

  ShareInherited({this.data, @required Widget child}) : super(child: child) {
    print('ShareInherited construct');
  }

  @override
  bool updateShouldNotify(ShareInherited oldWidget) {
    bool result = oldWidget.data != this.data;
    print('ShareInherited updateShouldNotify result = $result');
    return result;
  }

  static ShareInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareInherited);
  }
}

class WidgetA extends StatelessWidget {

  const WidgetA();

  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = ShareInherited.of(context).data;
    return Text('WidgetA data = $data');
  }
}

class WidgetB extends StatelessWidget {

  const WidgetB();

  @override
  Widget build(BuildContext context) {
    print('WidgetB build');
    return Text('WidgetB');
  }
}
