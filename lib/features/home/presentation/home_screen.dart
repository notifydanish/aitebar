import 'package:auto_route/auto_route.dart';
import 'package:etibaar/core/routes/app_routes.dart';
import 'package:etibaar/core/sl/service_locator.dart';
import 'package:etibaar/features/welcome/presentation/blocs/user/user_cubit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              sl<UserCubit>().logout();
              context.router.pushNamed(AppRoutes.welcome);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
