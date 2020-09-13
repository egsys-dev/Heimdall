import 'package:heimdall/model/route_back.dart';
import 'package:heimdall/model/route_forward.dart';

class SysRoute {
  ///Objeto de rota para navegação, usado para empilhar uma tela
  final RouteForward routeForward;

  ///Objeto de rota para navegação, usada para remover telas no popUntil
  final RouteBack routeBack;

  SysRoute({this.routeForward, this.routeBack});

  SysRoute.toRoot()
      : routeForward = null,
        routeBack = RouteBack(route: "/");

  SysRoute.pop([dynamic routeParameter])
      : routeForward = null,
        routeBack = RouteBack(routeParameter: routeParameter);

  SysRoute.routeForward(String route, {dynamic routeParameter})
      : routeForward = RouteForward(route, routeParameter: routeParameter),
        routeBack = null;

  SysRoute.popUntil(String route)
      : routeForward = null,
        routeBack = RouteBack(route: route);

  ///Irá voltar até a routeBack e depois empilhar a routeForward
  SysRoute.popUntilAndPush(
      {String routeBack, String routeForward, dynamic routeParameter})
      : routeForward =
            RouteForward(routeForward, routeParameter: routeParameter),
        routeBack = RouteBack(route: routeBack);
}

typedef CallbackRoute<T> = Function(T onCompleteData);
