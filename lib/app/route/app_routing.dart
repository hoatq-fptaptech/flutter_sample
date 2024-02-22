part of app_layer;

enum RouteDefine {
  loginScreen,
  homeScreen,
  listUserScreen,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      RouteDefine.loginScreen.name: (_) => LoginRoute.route,
      RouteDefine.homeScreen.name: (_) => HomeRoute.route,
      RouteDefine.listUserScreen.name: (_) => ListUserRoute.route,
    };

    final WidgetBuilder? routeBuilder = routes[settings.name];

    return MaterialPageRoute(
      builder: (BuildContext context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}
