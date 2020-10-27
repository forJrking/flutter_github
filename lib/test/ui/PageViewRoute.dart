import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Page Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PageViewRoute(),
    );
  }
}

class PageViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageViewRouteState();
}

class _PageViewRouteState extends State<PageViewRoute> {
  int bottomCurrentIndex = 0;

  PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '信息'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        onTap: (value) {
          setState(() {
            bottomCurrentIndex = value;
          });
          controller.jumpToPage(bottomCurrentIndex);
        },
        currentIndex: bottomCurrentIndex,
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      controller: controller,
      physics: BouncingScrollPhysics(),
      children: [
        HomePage(),
        MessagePage(),
        MyPage(),
      ],
      onPageChanged: (value) {
        setState(() {
          bottomCurrentIndex = value;
        });
      },
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
