import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/common/Global.dart';
import 'package:flutter_demo/models/UserInfo.dart';
import 'package:flutter_demo/net/Net.dart';
import 'package:flutter_demo/states/notifer.dart';
import 'package:flutter_demo/util/funs.dart';
import 'package:provider/provider.dart';

class ThemeRoute extends StatefulWidget {
  @override
  _ThemeRouteState createState() => _ThemeRouteState();
}

class _ThemeRouteState extends State<ThemeRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("主题"),
        ),
        body: _buildList());
  }

  _buildList() {
    return Consumer<ThemeModel>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: Global.themes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 38,
                      color: Global.themes[index],
                      child: Icon(value.theme == Global.themes[index]
                          ? Icons.check
                          : Icons.block))),
              onTap: () => value.theme = Global.themes[index],
            );
          },
        );
      },
    );
  }
}
