import 'package:flutter/material.dart';

class NavagationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(String routeName) {
    return navigatorKey.currentState!.pop();
  }
}

//final navigationService = _NavagationService();
