import 'package:auto_route/auto_route.dart';
import 'package:etibaar/core/extensions/build_context_extension.dart';
import 'package:etibaar/core/routes/app_routes.dart';
import 'package:etibaar/core/sl/service_locator.dart';
import 'package:etibaar/features/welcome/presentation/blocs/auth/auth_bloc.dart';
import 'package:etibaar/features/welcome/presentation/blocs/user/user_cubit.dart';
import 'package:etibaar/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final _authBloc = sl<AuthBloc>();
  final _userCubit = sl<UserCubit>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_userCubit.isAuthorized) {
        _authBloc.add(AuthEvent.fetchUser(uid: _userCubit.uid));
      } else {
        context.router.pushNamed(AppRoutes.welcome);
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: context.vertical,
            ),
            child: Center(child: Image.asset(Assets.app.appLogo.path)),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                success: (state) {
                  context.router.pushNamed(AppRoutes.home);
                  _userCubit.init(state.user);
                },
                failure: (state) {
                  context.showSnackBar(state.message);
                },
                orElse: () {
                  debugPrint('SplashScreen.build: ');
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
