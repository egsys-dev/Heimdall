///Classe base para o sistema de rotas, é extendida
///pela [RouteForwardModel] e pela [RouteBackModel], estas
///são usadas para retroceder e avançar na navegação
class BaseRoute {
  final String route;
  final dynamic routeParameter;

  const BaseRoute({this.route, this.routeParameter});
}
