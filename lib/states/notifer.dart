import 'package:flutter/material.dart';
import 'package:flutter_demo/common/Global.dart';
import 'package:flutter_demo/models/UserInfo.dart';
import 'package:flutter_demo/models/profile.dart';

//基类
class ProfileNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile().then((value) => print("ok"), onError: (e) {});
    super.notifyListeners();
  }
}

class UserModel extends ProfileNotifier {
  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  UserInfo get user => _profile.user;

  set user(UserInfo userInfo) {
    if (userInfo?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      //此处赋值数据给错 导致调试一直有问题
      _profile.user = userInfo;
      notifyListeners();
    }
  }
}

class ThemeModel extends ProfileNotifier {
  ColorSwatch get theme =>
      Global.themes.firstWhere((element) => element.value == _profile.theme,
          orElse: () => Global.themes.first);

  set theme(ColorSwatch color) {
    if (color != this.theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}

class LocaleModel extends ProfileNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (_profile.locale == null) return null;
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => _profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
