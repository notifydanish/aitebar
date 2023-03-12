import 'package:aitebar/core/routes/app_router.gr.dart';
import 'package:aitebar/core/routes/navigation_observer.dart';
import 'package:aitebar/core/theme/theme_light.dart';
import 'package:flutter/material.dart';


final _appRouter = AppRouter();

class EtibaarApp extends StatelessWidget {
  const EtibaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeLight().theme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(navigatorObservers: () => [NavigationObserver()]),
      debugShowCheckedModeBanner: false,
    );
  }
}
