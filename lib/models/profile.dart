import 'package:flutter_demo/models/CacheConfig.dart';
import 'package:flutter_demo/models/UserInfo.dart';

/// user : "$user"
/// token : ""
/// theme : 5678
/// cache : "$cacheConfig"
/// lastLogin : ""
/// locale : ""

class Profile {
  UserInfo _user;
  String _token;
  int _theme;
  CacheConfig _cache;
  String _lastLogin;
  String _locale;

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  int get theme => _theme;

  set theme(int value) {
    _theme = value;
  }

  CacheConfig get cache => _cache;

  set cache(CacheConfig value) {
    _cache = value;
  }

  String get lastLogin => _lastLogin;

  set lastLogin(String value) {
    _lastLogin = value;
  }

  String get locale => _locale;

  set locale(String value) {
    _locale = value;
  }

  Profile(
      {UserInfo user,
      String token,
      int theme,
      CacheConfig cache,
      String lastLogin,
      String locale}) {
    _user = user;
    _token = token;
    _theme = theme;
    _cache = cache;
    _lastLogin = lastLogin;
    _locale = locale;
  }

  Profile.fromJson(dynamic json) {
    _user = json["user"] != null ? UserInfo.fromJson(json["user"]) : null;
    _token = json["token"];
    _theme = json["theme"];
    _cache = json["cache"] != null ? CacheConfig.fromJson(json["cache"]) : null;
    _lastLogin = json["lastLogin"];
    _locale = json["locale"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user"] = _user?.toJson();
    map["token"] = _token;
    map["theme"] = _theme;
    map["cache"] = _cache?.toJson();
    map["lastLogin"] = _lastLogin;
    map["locale"] = _locale;
    return map;
  }
}
