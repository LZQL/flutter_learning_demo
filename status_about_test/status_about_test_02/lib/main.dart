import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ValueNotifier通信',
      home: ValueNotifierCommunication(),
    );
  }
}

/// ValueNotifier通信
///
/// ValueNotifier是一个包含单个值的变更通知器，当它的值改变的时候，会通知它的监听。

/// 1. 定义ValueNotifierData类，继承ValueNotifier
class ValueNotifierData extends ValueNotifier<String> {
  ValueNotifierData(value) : super(value);
}

/// 2. 定义_WidgetOne，包含一个ValueNotifierData的实例。
class _WidgetOne extends StatefulWidget {
  _WidgetOne({this.data});

  final ValueNotifierData data;

  @override
  _WidgetOneState createState() => _WidgetOneState();
}

/// 3. _WidgetOneState中给ValueNotifierData实例添加监听。
class _WidgetOneState extends State<_WidgetOne> {
  String info;

  @override
  initState() {
    super.initState();
    // 监听 value 的变化，会触发
    widget.data.addListener(_handleValueChanged);
    info = 'Initial mesage: ' + widget.data.value;
  }

  void _handleValueChanged() {
    setState(() {
      info = 'Message changed to: ' + widget.data.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(info),
    );
  }

  @override
  dispose() {
    widget.data.removeListener(_handleValueChanged);
    super.dispose();
  }
}

/// 4. 在ValueNotifierCommunication组件中实例化_WidgetOne，
/// 可以通过改变ValueNotifierData实例的value来触发_WidgetOneState的更新。
class ValueNotifierCommunication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifierData vd = ValueNotifierData('Hello World');
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifier通信'),
      ),
      body: _WidgetOne(data: vd),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            vd.value = 'Yes';
          }),
    );
  }
}
