import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:aitebar/core/routes/app_router.gr.dart';
import 'package:aitebar/core/sl/service_locator.dart';
import 'package:aitebar/features/auth/domain/models/user/user.dart';
import 'package:aitebar/features/welcome/presentation/blocs/auth/auth_bloc.dart';
import 'package:aitebar/features/welcome/presentation/blocs/user/user_cubit.dart';
import 'package:aitebar/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authBloc = sl<AuthBloc>();

  final _userCubit = sl<UserCubit>();

  @override
  void initState() {
    if (_userCubit.isAuthorized) {
      _authBloc.add(AuthEvent.fetchUser(uid: _userCubit.uid));
    } else {
      debugPrint('SplashScreen.build: not authorized');
      context.router.navigate(const WelcomeRoute());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('_SplashScreenState.build');
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(gradient: context.vertical),
              child: Center(child: Image.asset(Assets.app.appLogo.path, height: context.width * 0.6)),
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: (context, state) {
              state.whenOrNull(
                success: (AppUser user) {
                  debugPrint('SplashScreen.build -> success');
                  context.router.replaceAll([const HomeRoute()]);
                  _userCubit.init(user);
                },
                failure: (message) async {
                  debugPrint('SplashScreen.build: failure');
                  context.showSnackBar(message);
                  context.router.navigate(const WelcomeRoute());
                  await _userCubit.logout();
                },
              );
            },
            builder: (_, __) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
