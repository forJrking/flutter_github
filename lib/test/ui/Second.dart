import 'package:flutter/material.dart'; //Material风格
import 'package:flutter/widgets.dart'; //基础组件

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试页面2'),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',width: 100,),
              Image.asset('images/normal.png',),
            ],
          )

        ));
  }
}
