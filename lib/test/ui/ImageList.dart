import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart'; //Material风格
import 'package:flutter/widgets.dart'; //基础组件
import 'package:flutter_demo/test/bo/TestBean.dart';
import 'dart:convert';

class ImageList extends StatefulWidget {
  ImageList({Key key}) : super(key: key);

  @override
  _ListViewState createState() => _ListViewState();
}

class _ListViewState extends State<ImageList> {
  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表"),
      ),
      body: getBody(),
    );
  }

  getBody() {
    if (widgets.isEmpty) {
      return progressDialog();
    } else {
      return listView();
    }
  }

  progressDialog() => Center(
        child: CircularProgressIndicator(),
      );

  listView() {
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        });
  }

  getRow(int position) {
    var testBean = TestBean.fromJson(widgets[position]);
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
            width: 100,
            height: 100,
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '姓名 ${testBean.id}',
              style: TextStyle(color: Colors.black, fontSize: 18),
              textAlign: TextAlign.left,
            ),
            Wrap(
              children: [
                FlatButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "file", arguments: "$position");
                      // Navigator.pushNamed(context, "Browser");
                      // NavigationService.getInstance().pushNamed('Browser');
                      BotToast.showSimpleNotification(title: "${testBean.title}");
                    },
                    child: Text(
                      '${testBean.title}',
                      style: TextStyle(color: Colors.red),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            )
          ],
        ),flex: 1,)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {

    });
  }
}
