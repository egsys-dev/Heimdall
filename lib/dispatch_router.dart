import 'package:fancy_stream/fancy_stream.dart';
import 'package:flutter/material.dart';
import 'package:heimdall/model/sys_route.dart';
import 'package:heimdall/navigation/navigation_service.dart';
import 'package:heimdall/navigation/strategy_route.dart';
import 'package:heimdall/navigation/strategy_route_default.dart';



abstract class DispatchRouter  {

    void dispatch(SysRoute route);

}

class DispatchRouterImp extends FancyDelegate implements DispatchRouter {
  late StrategyRoute _strategyRoute;
  GlobalKey<NavigatorState> navigatorKey = NavigationService().navigatorKey;

  static final DispatchRouterImp _instance = DispatchRouterImp._();

  DispatchRouterImp._() {
    listenOn<SysRoute>(onRouteDispatched);
  }
  

  void init({StrategyRoute? strategyRoute}) {
    _strategyRoute = strategyRoute ?? StrategyRouteDefault(NavigationService());
  }

  factory DispatchRouterImp()  => _instance;

  @override
  void dispatch(SysRoute route){
    dispatchOn<SysRoute>(route);
  }

  void onRouteDispatched(SysRoute sysRoute) {
    _strategyRoute.onRoute(sysRoute);
  } 
}
