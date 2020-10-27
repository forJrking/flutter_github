import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/currentRoute/currentRoute.dart';
import 'package:flutter_demo/util/event.dart';

///
/// eventbus 测试类
///

class EventHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [CurrentRouteNavigatorObserver()],
      home: Receiver(),
    );
  }
}

class StringEvent {
  String num;

  StringEvent(this.num);
}

class Receiver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  String title;

  @override
  void initState() {
    super.initState();
    NxEventBus.instance.bus.on<StringEvent>().listen((event) {
      setState(() {
        title = event.num;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    NxEventBus.instance.bus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("接收器"),
      ),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
            child: Text("跳转路由"),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Send(),)),
          ),
          Text(title ?? "无数据")
        ],
      )),
    );
  }
}

class Send extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('发送'),
        onPressed: () {
          NxEventBus().bus.fire(StringEvent(Random().nextInt(100).toString()));
        },
      ),
    );
  }
}
