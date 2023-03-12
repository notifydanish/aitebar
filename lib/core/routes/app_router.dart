import 'package:aitebar/core/routes/app_routes.dart';
import 'package:aitebar/features/auth/presentation/pages/sign_in_page.dart';
import 'package:aitebar/features/auth/presentation/pages/sign_up_page.dart';
import 'package:aitebar/features/fonds_details/presentation/funds_details_page.dart';
import 'package:aitebar/features/home/presentation/pages/home_page.dart';
import 'package:aitebar/features/welcome/presentation/screens/splash_page.dart';
import 'package:aitebar/features/welcome/presentation/screens/welcome_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: WelcomePage, path: AppRoutes.welcome),
    AutoRoute(page: HomePage, path: AppRoutes.home),
    AutoRoute(page: FundsDetailsPage, path: AppRoutes.fundsDetails),
    AutoRoute(page: SignInPage, path: AppRoutes.signIn),
    AutoRoute(page: SignUpPage, path: AppRoutes.signUp),
  ],
)
class $AppRouter {}
