import 'package:flutter/material.dart';
import 'package:heimdall/heimdall.dart';
import 'package:heimdall/model/sys_route.dart';
import 'package:heimdall/navigation/navigation_service.dart';

///Estrutura para as tratativas de rotas internas do sistema
///Utilizada por  [StartApplication] ao solicitar uma navegação no sistema.
///Suas implementações devem ter o objetivo navegar até a rota informada.
abstract class StrategyRoute {
  final NavigationService navigationService;
  StrategyRoute(this.navigationService);

  ///Será chamado quando  [StartApplication]  receber evento de navegar.

  ///Verifica qual comportamento deve adotar, se receber um [RouteBackModel]
  ///irá chamar o [_onBack] que vai tratar de retroceder as rotas de acordo com
  ///o objeto, caso contrário, com um [RouteForwardModel] irá chamar o [_onForward]
  ///para avançar a navegação
  ///
  ///Caso um objeto de [RouteBackModel] chegue com o atributo route nulo o algoritmo
  ///irá simplesmente dar um pop na pilha de telas
  ///Se a rota enviada no [RouteBackModel] for "/" será retornado até a tela root do sistema.
  void onRoute(SysRoute sysRoute) {
    if (sysRoute.routeBack != null) {
      onBack(sysRoute.routeBack!);
    }

    if (sysRoute.routeForward != null) {
      onForward(sysRoute.routeForward!);
    }
  }

  void onForward(RouteForward routeForwardModel);

  void onBack(RouteBack routeBackModel);
}
