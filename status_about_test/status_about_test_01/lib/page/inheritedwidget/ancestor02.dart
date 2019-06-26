import 'package:flutter/material.dart';

/// ancestorWidgetOfExactType
/// 子widget无法检测到父widget的更改
/// （父widget rebuild 子widget no rebuild）
class MyAncestorTree02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TopPage02(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Title'),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new WidgetA(),
            new WidgetB(),
            new WidgetC(),
          ],
        ),
      ),
    );
  }
}

class Item {
  String reference;

  Item(this.reference);
}

class TopPage02 extends StatefulWidget {
  TopPage02({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  final TopPage02State state = new TopPage02State();

  @override
  TopPage02State createState() {
    return state;
  }

  static TopPage02State of(BuildContext context) {
    /// 通过从 TopPage02 的 context 得到树结构来返回第一个 TopPage02State
    return (context.ancestorWidgetOfExactType(TopPage02)
            as TopPage02)
        .state;

  }
}

class TopPage02State extends State<TopPage02> {

  List<Item> _items = <Item>[];

  int get itemsCount => _items.length;

  void addItem(String reference) {
    setState(() {
      _items.add(new Item(reference));
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class WidgetA extends StatefulWidget {
  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    final TopPage02State state = TopPage02.of(context);
    return new Center(
      child: new RaisedButton(
        child: new Text('WidgetA :Add Item'),
        onPressed: () {
          /// 这边调用 addItem 方法，但是WidgetA，WidgetB，WidgetC
          /// 并不会 build
          /// 这就说明了：widget的构建方法的返回值不应该依赖于该方法返回的值，
          /// 因为如果该方法的返回值发生更改，构建上下文将不会重新生成。
          /// 这可能会导致生成方法中使用的数据发生更改，但是没有重新生成widget
          state.addItem('new item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TopPage02State state = TopPage02.of(context);
    return new Text('widgetB itemCount:${state.itemsCount}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text('I am Widget C');
  }
}
