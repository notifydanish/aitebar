import 'package:auto_route/auto_route.dart';
import 'package:etibaar/core/routes/app_routes.dart';
import 'package:etibaar/features/home/presentation/home_screen.dart';
import 'package:etibaar/features/welcome/presentation/screens/splash_screen.dart';
import 'package:etibaar/features/welcome/presentation/screens/welcome_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: WelcomeScreen, path: AppRoutes.welcome),
    AutoRoute(page: HomeScreen, path: AppRoutes.home),
    // AutoRoute(page: BookDetailsPage),
  ],
)
class $AppRouter {}
