import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/RoutePages.dart';
import 'package:flutter_demo/models/repo.dart';
import 'package:flutter_demo/net/Net.dart';
import 'package:flutter_demo/routes/HomeDrawer.dart';
import 'package:flutter_demo/states/notifer.dart';
import 'package:provider/provider.dart';

import 'home/RepoItem.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub 客户端"),
      ),
      body: _buildBody(),
      drawer: HomeDrawer(),
    );
  }

  _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
        child: RaisedButton(
          child: Text("登录"),
          onPressed: () => Navigator.of(context).pushNamed(RoutePages.login),
        ),
      );
    } else {
      return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
          var data = await GitNet(context).getRepos(
            refresh: refresh,
            queryParameters: {
              'page': page,
              'page_size': 20,
            },
          );
          //把请求到的新数据添加到items中
          items.addAll(data);
          // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
          return data.length == 20;
        },
        itemBuilder: (List<Repo> list, int index, BuildContext ctx) {
          // 项目信息列表项
          return GestureDetector(
            child: RepoItem(list[index]),
            onTap: () => Navigator.of(context).pushNamed(RoutePages.browser,
                arguments: (list[index].html_url)),
          );
        },
      );
    }
  }
}
