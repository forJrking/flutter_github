// 提供五套可选主题色
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/CacheConfig.dart';
import 'package:flutter_demo/models/profile.dart';
import 'package:flutter_demo/net/CacheObject.dart';
import 'package:flutter_demo/net/Net.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

const String _key_profile = "_key_profile";

class Global {
  static SharedPreferences _prefs;

  //全局配置
  static Profile profile = new Profile();

  static NetCache netCache = new NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      var jsonString = _prefs.getString(_key_profile);
      if (jsonString != null) {
        profile = Profile.fromJson(json.decode(jsonString));
      }

      //缓存策略
      profile.cache = profile.cache ?? CacheConfig()
        ..maxAge = 3600
        ..enable = true
        ..maxCount = 100;
      //网络库初始化
      GitNet.init();
    } catch (e) {
      print(e);
    }
  }

  // 持久化Profile信息
  static Future saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key_profile, jsonEncode(profile.toJson()));
  }
}
