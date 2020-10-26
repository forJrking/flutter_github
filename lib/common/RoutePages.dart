import 'package:flutter/widgets.dart';
import 'package:flutter_demo/routes/Broswer.dart';
import 'package:flutter_demo/routes/HomeRoute.dart';
import 'package:flutter_demo/routes/LoginRoute.dart';
import 'package:flutter_demo/routes/ThemeRoute.dart';

class RoutePages {
  static const String login = "login";
  static const String home = "home";
  static const String language = "language";
  static const String browser = "Browser";

  static const String theme = "theme";

  static Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        login: (context) => LoginRoute(),
        home: (context) => HomeRoute(),
        theme: (context) => ThemeRoute(),
        // language: (context) => LanguageRoute(),
        browser: (context) => Browser(),
      };
}
