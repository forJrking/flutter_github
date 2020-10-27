import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrentRouteNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    _showRouteTip(previousRoute);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    _showRouteTip(route);
  }

  void _showRouteTip(Route route) {
    if (route is MaterialPageRoute) {
      new Future.delayed(Duration(milliseconds: 50)).then((value) {
        if (route.isActive) {
          var string = route.builder.runtimeType.toString();
          Float.show(
            context: route.subtreeContext,
            message: "${string.split("=> ")[1]}",
          );
        }
      });
    }
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
  }
}

/// 利用overlay实现悬浮
class Float {
  static OverlayEntry overlayEntry;

  static OverlayEntry show(
      {@required BuildContext context, @required String message}) {

    try {
      overlayEntry.remove();
    } catch (e) {
      print(e);
    }
    //创建一个OverlayEntry对象
    overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
        top: MediaQuery.of(context).padding.top,
        child: new Material(
            color: const Color(0x4c000000),
            child: new Padding(
              padding:
                  EdgeInsets.only(left: 1.5, right: 1.5, top: 1, bottom: 1),
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            )),
      );
    });
    Overlay.of(context).insert(overlayEntry);
  }
}
