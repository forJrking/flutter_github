import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; //Material风格
import 'package:flutter/widgets.dart'; //基础组件
import 'dart:convert';

import 'package:flutter_demo/net/Net.dart';
import 'package:flutter_demo/test/bo/TestBean.dart';

class DioList extends StatefulWidget {
  @override
  DioListState createState() => DioListState();
}

class DioListState extends State<DioList> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16),
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: FutureBuilder(
        future: dio.get("https://jsonplaceholder.typicode.com/posts"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response result = snapshot.data;
            if (snapshot.hasError) {
              return Text("NetWork Error:${result.statusMessage.toString()}");
            }
            return ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(context, position);
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget getRow(BuildContext context, int position) {
    var testBean = TestBean();
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(0),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: getimage(position),
            ),
            Column(
              children: [
                Text(
                  "条目:${testBean.id}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    backgroundColor: Colors.red,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "副标题:${testBean.body}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    backgroundColor: Colors.blue,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ],
        ));
  }

  Image getimage(int position) => position % 2 == 0
      ? Image.asset(
          'images/normal.png',
          width: 80,
          height: 80,
        )
      : Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          width: 80,
          height: 80,
        );
}
