import 'package:flutter/material.dart';

/// 上移`Child`对象到`InheriteWidget`的`Parent Widget`
/// Widget A ，FlatButton rebuild, Widget B  no rebuild
class InheritedWidgetOut01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetOut01State();
  }
}

class InheritedWidgetOut01State extends State<InheritedWidgetOut01> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MyWidget(
          Column(
            children: <Widget>[
              WidgetA(),
              WidgetB()
            ],
          )
      ),
    );
  }
}

class MyWidget extends StatefulWidget {

  final Widget child;
  MyWidget(this.child);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  int tempData = 0;

  @override
  Widget build(BuildContext context) {
    return ShareInherited(
      data: tempData,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.child,
            FlatButton(
                  child: Text("Click me"),
                  onPressed: () {
                    setState(() {
                      print('onPressed');
                      tempData += 1;
                    });
                  },
                )
          ],
        ),
      ),
    );
  }
}

class ShareInherited extends StatelessWidget {
  final int data;
  final Widget child;


  ShareInherited({
    Key key,
    this.data,
    this.child
  }): assert(child != null),
        assert(data != null),
        super(key: key);

  static int of(BuildContext context) {
    final _ShareInherited inheritedTheme = context.inheritFromWidgetOfExactType(_ShareInherited);
    return inheritedTheme.shareInherited.data;
  }

  @override
  Widget build(BuildContext context) {
    return _ShareInherited(shareInherited:this , child: child,);
  }
}

class _ShareInherited extends InheritedWidget{

  final ShareInherited shareInherited;

  _ShareInherited({
    Key key,
    @required this.shareInherited,
    @required Widget child,
  }):assert(shareInherited != null),
  super(key: key, child: child);

  @override
  bool updateShouldNotify(_ShareInherited oldWidget) {
    return shareInherited.data != oldWidget.shareInherited.data;
  }

}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = ShareInherited.of(context);
    return Text('WidgetA data = $data');
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('WidgetB build');
    return Text('WidgetB');
  }
}

