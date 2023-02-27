import 'package:auto_route/auto_route.dart';
import 'package:etibaar/core/extensions/build_context_extension.dart';
import 'package:etibaar/core/routes/app_routes.dart';
import 'package:etibaar/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => context.router.pushNamed(AppRoutes.welcome));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: context.vertical,
        ),
        child: Center(child: Image.asset(Assets.app.appLogo.path)),
      ),
    );
  }
}
