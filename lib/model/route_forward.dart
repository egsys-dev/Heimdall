import 'package:heimdall/model/base_route.dart';
import 'package:heimdall/model/sys_route.dart';

///Classe responsável por criar o comportamento de avançar
///no sistema de rotas
class RouteForward<T> extends BaseRoute {
  @override
  final String route;

  ///Atributo utilizado para retornar algum
  ///valor da tela empilhada, para tipa-lo
  ///devemos tipar a chamada do [CoreNavigator.navigateTo]
  final CallbackRoute<T>? onComplete;

  const RouteForward(this.route, {this.onComplete, Object? routeParameter})
      : super(route: route, routeParameter: routeParameter);
}
