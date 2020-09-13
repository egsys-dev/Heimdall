import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();

  static final NavigationService _instance = NavigationService._();

  factory NavigationService() => _instance;

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  NavigatorState get navigator => navigatorKey.currentState;
}
