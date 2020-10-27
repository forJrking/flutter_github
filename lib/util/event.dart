/*
#event_bus
event_bus: ^1.1.1

EventBus 全局事件总线管理

@示例
    //监听
    NxEventBus.instance.bus.on<StringEvent>().listen((event) {
      setState(() {
        title = event.num;
      });
    });

*/

import 'package:event_bus/event_bus.dart';

class NxEventBus {

  static NxEventBus get instance => _getInstance();

  //工厂模式
  factory NxEventBus() => _getInstance();

  static NxEventBus _instance;

  EventBus bus;

  NxEventBus._internal() {
    bus = new EventBus();
  }

  static _getInstance() {
    return _instance ??= new NxEventBus._internal();
  }
}
