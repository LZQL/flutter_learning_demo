import 'package:flutter/material.dart';

/// 上移`Child`对象到`InheriteWidget`的`Parent Widget`
/// Widget A rebuild, Widget B Widget C no rebuild
class InheritedWidgetOut03 extends StatefulWidget {
  @override
  _InheritedWidgetOut03State createState() => new _InheritedWidgetOut03State();
}

class _InheritedWidgetOut03State extends State<InheritedWidgetOut03> {
  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Title'),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[new WidgetA(), new WidgetB(), new WidgetC()],
          ),
        ),
      ),
    );
  }
}

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(
      [BuildContext context, bool rebuild = true]) {
    return (rebuild
            ? context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited
            : context.ancestorWidgetOfExactType(_MyInherited) as _MyInherited)
        .data;
    // 通过从 MyInheritedWidget 的 context 得到树结构来返回第一个 MyInheritedWidgetState
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {

  int tempData = 0;

  /// Helper method to add an Item
  void addItem() {
    setState(() {
      tempData++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Widget A build');
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Text('WidgetA data = ${state.tempData}');
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Widget B build');
    return Text('WidgetB');
  }
}

class WidgetC extends StatefulWidget {
  @override
  _WidgetCState createState() => _WidgetCState();
}

class _WidgetCState extends State<WidgetC> {
  @override
  Widget build(BuildContext context) {
    print('Widget C build');
    final MyInheritedWidgetState state = MyInheritedWidget.of(context, false);
    return RaisedButton(
      child: Text("Click me"),
      onPressed: () {
        print('onPressed');
        state.addItem();
      },
    );
  }
}
