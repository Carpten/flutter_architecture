import 'package:flutter_architecture/pages/login/routers.dart' as login;
import 'package:flutter_architecture/pages/index/routers.dart' as index;
import 'package:flutter_architecture/pages/splash/routers.dart' as splash;
import 'package:flutter_architecture/router/route_item.dart';

class RouteConfigs {
  List<RouteItem> routeConfigs = List();

  RouteConfigs() {
    routeConfigs.addAll(splash.routers);
    routeConfigs.addAll(login.routers);
    routeConfigs.addAll(index.routers);
  }
}

RouteConfigs routeConfigs = RouteConfigs();
