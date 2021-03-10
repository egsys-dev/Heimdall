import 'package:flutter/material.dart';
import 'package:heimdall/model/route_back.dart';
import 'package:heimdall/model/route_forward.dart';
import 'package:heimdall/navigation/navigation_service.dart';
import 'package:heimdall/navigation/strategy_route.dart';

///Implementação padrão do [StrategyRoute].
@immutable
class StrategyRouteDefault extends StrategyRoute {
  StrategyRouteDefault(NavigationService navigationService)
      : super(navigationService);

  @override
  void onForward(RouteForward routeForwardModel) {
    navigationService.navigator
        ?.pushNamed(routeForwardModel.route,
            arguments: routeForwardModel.routeParameter)
        .then((completedObject) =>
            routeForwardModel.onComplete?.call(completedObject));
  }

  @override
  void onBack(RouteBack routeBackModel) {
    if (routeBackModel.route == null) {
      navigationService.navigator?.pop(routeBackModel.routeParameter);
    } else {
      navigationService.navigator
          ?.popUntil(ModalRoute.withName(routeBackModel.route ?? "/"));
    }
  }
}
