import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

part 'main.g.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: const MainRoute().location,
        routes: $appRoutes,
      ),
    );
  }
}

enum QueryParam {
  valid,
}

@TypedGoRoute<MainRoute>(path: '/home')
class MainRoute extends GoRouteData {
  const MainRoute({this.param});
  final QueryParam? param;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(child: Text('Main page with param: ${param?.name}')),
    );
  }
}