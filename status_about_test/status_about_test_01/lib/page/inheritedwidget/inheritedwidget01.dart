import 'package:flutter/material.dart';

/// InheritedWidget01 , 会导致 `widgetA`，` widgeB`,`RaisedButton `会重新`build`
  class InheritedWidgetTest01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetTest01State();
  }
}

class InheritedWidgetTest01State extends State<InheritedWidgetTest01> {
  int tmpData = 0;

  @override
  Widget build(BuildContext context) {
    print('InheritedWidgetTest01 build');
    return Scaffold(
      body: Center(
        child: ShareInherited(
          data: tmpData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WidgetA(),
              WidgetB(),
              RaisedButton(
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
  final int data; //需要在子树中共享的数据，保存点击次数

  ShareInherited({@required this.data, @required Widget child}) : super(child: child) {
    print('ShareInherited construct');
  }

  /// 允许所有子 widget 通过包含的 context 获得最近的 ShareInherited 实例
  /// 定义一个便捷方法，方便子树中的widget获取共享数据
  /// 在内部，除了简单地返回 ShareInherited 实例外，它还订阅消费者 widget 以便用于通知更改
  static ShareInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareInherited);
  }

  /// 用来告诉 InheritedWidget 如果对数据进行了修改，
  /// 是否必须将通知传递给所有子 widget（已注册/已订阅）
  @override
  bool updateShouldNotify(ShareInherited oldWidget) {
    // 如果返回true，则子树中依赖(build函数中有调用)本widget
    // 的子widget的`state.didChangeDependencies`会被调用
    bool result = oldWidget.data != this.data;
    print('ShareInherited updateShouldNotify result = $result');
    return result;
  }
}

class WidgetA extends StatefulWidget {
  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    print('WidgetA build');
    int data = ShareInherited.of(context).data;
    return Text('WidgetA data = $data');
  }

  @override
  void didChangeDependencies() {
    print('WidgetA didChangeDependencies');
    super.didChangeDependencies();
  }
}

class WidgetB extends StatefulWidget {
  @override
  _WidgetBState createState() => _WidgetBState();
}

class _WidgetBState extends State<WidgetB> {
  @override
  Widget build(BuildContext context) {
    print('WidgetB build');
    return Text('WidgetB');
  }

  @override
  void didChangeDependencies() {
    print('WidgetB didChangeDependencies');
    super.didChangeDependencies();
  }
}
