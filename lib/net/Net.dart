import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/Global.dart';
import 'package:flutter_demo/models/UserInfo.dart';
import 'package:flutter_demo/models/repo.dart';

//一般采用单例
var dio = Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.v3+json",
    },
    receiveTimeout: 15 * 1000,
    connectTimeout: 15 * 1000,
    sendTimeout: 10 * 1000));

class GitNet {
  BuildContext context;
  Options _options;

  GitNet([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static init() {
    //缓存拦截器
    dio.interceptors.add(Global.netCache);
    dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
    //登录授权
    dio.options.headers[HttpHeaders.authorizationHeader] =
        Global.profile?.token;
    //证书处理
//     if (!Global.isRelease) {
//       (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//           (client) {
//         client.findProxy = (uri) {
//           return "PROXY 10.1.10.250:8888";
//         };
// //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
//         client.badCertificateCallback =
//             (X509Certificate cert, String host, int port) => true;
//       };
//     }
  }

  Future<UserInfo> login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));

    var response = await dio.get(
      "/users/$login",
      options: _options.merge(extra: {
        "noCache": true, //本接口禁用缓存
      }),
    );

    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = basic;

    return UserInfo.fromJson(response.data);
  }

  //获取用户项目列表
  Future<List<Repo>> getRepos(
      {Map<String, dynamic> queryParameters, //query参数，用于接收分页信息
      refresh = false}) async {
    if (refresh) {
      // 列表下拉刷新，需要删除缓存（拦截器中会读取这些信息）
      _options.extra.addAll({"refresh": true, "list": true});
    }
    var r = await dio.get<List>(
      "user/repos",
      queryParameters: queryParameters,
      options: _options,
    );
    return r.data.map((e) => Repo.fromJson(e)).toList();
  }
}
