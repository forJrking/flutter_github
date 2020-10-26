import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/common/RoutePages.dart';
import 'package:flutter_demo/states/notifer.dart';
import 'package:flutter_demo/util/funs.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Expanded(child: _buildMenus()),
            ],
          )),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel value, Widget child) {
          return Container(
              color: Theme
                  .of(context)
                  .primaryColor,
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 16),
              child: GestureDetector(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: gmAvatar(
                          value.isLogin ? value.user.avatar_url : null,
                          width: 80, height: 80),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          value.isLogin ? value.user.name : "登录",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                onTap: () {
                  if (!value.isLogin)
                    Navigator.of(context).pushNamed(RoutePages.login);
                },
              ));
        });
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (context, value, child) {
        return ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text("主题"),
              onTap: () {
                Navigator.of(context).pushNamed(RoutePages.theme);
              },
            ), ListTile(
              leading: const Icon(Icons.language),
              title: Text("语言"),
              onTap: () {
                showToast('开发中');
              },
            ),
            if(value.isLogin)ListTile(
              leading: const Icon(Icons.power_settings_new),
              title: Text("注销"),
              onTap: () {
                showDialog(context: context, builder: (context) =>
                    AlertDialog(content: Text('确定退出登录?'),
                      actions: [
                        FlatButton(onPressed: () => Navigator.pop(context),
                          child: Text('取消'),),
                        FlatButton(onPressed: () {
                          value.user = null;
                          Navigator.pop(context);
                        }, child: Text('注销'))
                      ],),);
              },
            )
          ],
        );
      },
    );
  }
}
