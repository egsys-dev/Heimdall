import 'package:fancy_stream/fancy_stream.dart';
import 'package:flutter/material.dart';
import 'package:heimdall/model/sys_route.dart';
import 'package:heimdall/navigation/navigation_service.dart';
import 'package:heimdall/navigation/strategy_route.dart';
import 'package:heimdall/navigation/strategy_route_default.dart';

class DispatchRouter extends Disposable {
  StrategyRoute _strategyRoute;
  GlobalKey<NavigatorState> navigatorKey = NavigationService().navigatorKey;

  static final DispatchRouter _instance = DispatchRouter._();

  DispatchRouter._() {
    listenOn<SysRoute>(onRouteDispatched);
  }

  void init(StrategyRoute strategyRoute) {
    _strategyRoute = strategyRoute;
  }

  factory DispatchRouter() {
    _instance._strategyRoute ??= StrategyRouteDefault(NavigationService());

    return _instance;
  }

  void onRouteDispatched(SysRoute sysRoute) => _strategyRoute.onRoute;
}
