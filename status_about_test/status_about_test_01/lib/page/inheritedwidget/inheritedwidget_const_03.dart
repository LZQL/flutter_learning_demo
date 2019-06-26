import 'package:flutter/material.dart';

/// 使用 const
/// Widget A rebuild, Widget B Widget C no rebuild
class InheritedWidgetConst03 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetConst03State();
  }
}

class InheritedWidgetConst03State extends State<InheritedWidgetConst03> {
  int tmpData = 0;

  void addItem() {
    setState(() {
      tmpData++;
    });
  }

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
              const WidgetC(),
            ],
          ),
          state: this,
        ),
      ),
    );
  }
}

class ShareInherited extends InheritedWidget {
  final int data;
  final InheritedWidgetConst03State state;

  ShareInherited({this.data, @required Widget child, this.state})
      : super(child: child) {
    print('ShareInherited construct');
  }

  @override
  bool updateShouldNotify(ShareInherited oldWidget) {
    bool result = oldWidget.data != this.data;
    print('ShareInherited updateShouldNotify result = $result');
    return result;
  }

  static ShareInherited of([BuildContext context, bool rebuild = true]) {
    return (rebuild
        ? context.inheritFromWidgetOfExactType(ShareInherited)
        : context.ancestorWidgetOfExactType(ShareInherited) );
  }
}

class WidgetA extends StatelessWidget {

  const WidgetA();

  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = ShareInherited
        .of(context)
        .data;
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

class WidgetC extends StatelessWidget {
  const WidgetC();
  @override
  Widget build(BuildContext context) {
    print('Widge C build');
    InheritedWidgetConst03State state = ShareInherited.of(context,false).state;

    return FlatButton(
      child: Text("Click me"),
      onPressed: () {
        print('onPressed');
        state.addItem();
      },
    );
  }
}




//class WidgetC extends StatefulWidget {
//
//
//  @override
//  _WidgetCState createState() => _WidgetCState();
//
//  const WidgetC();
//}
//
//class _WidgetCState extends State<WidgetC> {
//  @override
//  Widget build(BuildContext context) {
//    print('Widge C build');
//    InheritedWidgetTest02State state = ShareInherited
//        .of(context)
//        .state;
//
//    return FlatButton(
//      child: Text("Click me"),
//      onPressed: () {
//        print('onPressed');
//        state.addItem();
//      },
//    );
//  }
//}

