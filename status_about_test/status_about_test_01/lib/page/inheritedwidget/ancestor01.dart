import 'package:flutter/material.dart';

/// ancestorWidgetOfExactType 获取父widget的一些信息
class MyAncestorTree01 extends StatefulWidget {
  @override
  _MyAncestorTree01State createState() => _MyAncestorTree01State();
}

class _MyAncestorTree01State extends State<MyAncestorTree01> {
  @override
  Widget build(BuildContext context) {
    return TopPage01();
  }
}

class TopPage01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final HomePageState state = HomePageState();

  @override
  HomePageState createState() {
    return state;
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  void incrementCounter() {

    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WidgetA(),
          WidgetB(),
          WidgetC(),
        ],
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 获取 HomePageState 来获取 counter
    final HomePage widget =
        context.ancestorWidgetOfExactType(HomePage);
    final HomePageState state = widget?.state;

    return Center(
      child: Text(
        '${state == null ? 0 : state.counter}',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Widget  B  Text');
  }
}

class WidgetC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// 获取 HomePageState 来 调用 加法操作
    final HomePage widget = context.ancestorWidgetOfExactType(HomePage);
    final HomePageState state = widget?.state;

    return RaisedButton(
      onPressed: () {
        state?.incrementCounter();
      },
      child: Icon(Icons.add),
    );
  }
}
