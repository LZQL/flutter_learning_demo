import 'package:flutter/material.dart';

/// 使用 const
/// Widget A ,Widget C  rebuild, Widget B  no rebuild
class InheritedWidgetConst02 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetConst02State();
  }
}

class InheritedWidgetConst02State extends State<InheritedWidgetConst02> {
  int tmpData = 0;

  void addItem(){
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
              WidgetC(),
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
  final InheritedWidgetConst02State state;
  ShareInherited({this.data, @required Widget child,this.state}) : super(child: child) {
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



class WidgetC extends StatefulWidget {
  @override
  _WidgetCState createState() => _WidgetCState();
}

class _WidgetCState extends State<WidgetC> {
  @override
  Widget build(BuildContext context) {
    print('Widge C build');
    InheritedWidgetConst02State state = ShareInherited.of(context).state;

    return FlatButton(
      child: Text("Click me"),
      onPressed: () {
        setState(() {
          print('onPressed');
          state.addItem();
        });
      },
    );
  }
}

