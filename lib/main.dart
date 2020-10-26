import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_demo/common/RoutePages.dart';
import 'package:flutter_demo/states/notifer.dart';
import 'package:flutter_demo/util/funs.dart';
import 'package:provider/provider.dart';

import 'common/Global.dart';
import 'common/NavigationService.dart';

void main() {
  //平台工具
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  //初始化
  Global.init().then((value) => runApp(new MyApp())).catchError((e) {
    print(e);
  });
}

//下面是界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(builder:
          (BuildContext context, themeModel, localeModel, Widget child) {
        return MaterialApp(
          title: 'Github Client',
          navigatorKey: NavigationService.getInstance().navigatorKey,
          //路由辅助 用于没有context跳转
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            //切换主题
            primarySwatch: themeModel.theme,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: localeModel.getLocale(),
          localeResolutionCallback:
              (Locale _locale, Iterable<Locale> supportedLocales) {
            if (localeModel.getLocale() != null) {
              //如果已经选定语言，则不跟随系统
              return localeModel.getLocale();
            } else {
              Locale locale;
              //APP语言跟随系统语言，如果系统语言不是中文简体或美国英语，
              //则默认使用美国英语
              if (supportedLocales.contains(_locale)) {
                locale = _locale;
              } else {
                locale = Locale('en', 'US');
              }
              return locale;
            }
          },
          routes: RoutePages.routes,
          initialRoute: RoutePages.home,
          onUnknownRoute: (settings) {
            if (!Global.isRelease) showToast("路由跳转未知:${settings.name}");
            return null;
          },
        );
      }),
    );
  }
}
