import 'package:flutter/material.dart';


abstract class BaseRoutePageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    onInit(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    onDestroy();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume(context);
    } else if (state == AppLifecycleState.paused) {
      onPause(context);
    }
  }

  onInit(BuildContext context) async {
    print('in origin init func');
  }

  onResume(BuildContext context) async {
    print('in origin onResume func');
  }

  onPause(BuildContext context) async {
    print('in origin onPause func');
  }

  onDestroy() async {
    print('in origin destroy func');
  }
}