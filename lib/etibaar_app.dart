import 'package:etibaar/core/routes/app_router.gr.dart';
import 'package:etibaar/core/theme/theme_light.dart';
import 'package:flutter/material.dart';

class EtibaarApp extends StatelessWidget {
  EtibaarApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      theme: ThemeLight().theme,
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
