import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(title: Text('inheritedwidget02'),),
          body: InheritedWidgetTest02()),
    );
    
  }
}

class InheritedWidgetTest02 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetTest02State();
  }
}

class InheritedWidgetTest02State extends State<InheritedWidgetTest02> {
  int tmpData = 0;
  @override
  Widget build(BuildContext context) {
    print('InheritedWidgetTest01 build');
    return Center(
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
    );
  }
}

class ShareInherited extends InheritedWidget {
  final int data;

  ShareInherited({this.data, Widget child}) : super(child : child) {
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


  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = ShareInherited.of(context).data;
    return Text('WidgetA data = $data');
  }

  const WidgetA();
}

class WidgetB extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print('WidgetB build');
    return Text('WidgetB');
  }

  const WidgetB();
}

