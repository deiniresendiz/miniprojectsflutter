import 'package:base/locator.dart';
import 'package:base/router/route_generator.dart';
import 'package:base/router/router.dart';
import 'package:base/services/navigation_service.dart';
import 'package:base/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas App',
      initialRoute: '/',
      // routes: {
      //   '/sateful': (_) => CounterPage(),
      //   '/provider': (_) => CounterProviderPage(),
      // },
      //onGenerateRoute: RouteGenerator.generateRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavagationService>().navigatorKey,
      builder: (_, child) {
        return MainLayourPage(
          child: child!,
        );
      },
    );
  }
}
