import 'package:aitebar/core/constants/app_strings.dart';
import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:aitebar/core/routes/app_router.gr.dart';
import 'package:aitebar/core/sl/service_locator.dart';
import 'package:aitebar/features/auth/domain/models/user/user.dart';
import 'package:aitebar/features/welcome/presentation/blocs/user/user_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          width: 300.0,
          height: context.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: context.background,
            border: Border.all(color: context.primary.withOpacity(0.2)),
          ),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BlocSelector<UserCubit, UserState, AppUser?>(
                          bloc: sl<UserCubit>(),
                          selector: (state) => state.user,
                          builder: (context, user) {
                            if (user == null) {
                              return const ListTile(
                                title: Text('Login is required'),
                              );
                            }
                            return ListTile(
                              leading: const CircleAvatar(child: Icon(LineIcons.user)),
                              title: Text('${user.name}', maxLines: 1, overflow: TextOverflow.ellipsis),
                              subtitle: Text('${user.email}', maxLines: 1, overflow: TextOverflow.ellipsis),
                            );
                          },
                        ),
                        Divider(
                          color: context.primary.withOpacity(0.2),
                        ),
                        ListTile(
                          title: const Text('Item 1'),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        ),
                        ListTile(
                          title: const Text('Item 2'),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(LineIcons.alternateSignOut),
                  title: const Text(AppStrings.logout),
                  onTap: () {
                    sl<UserCubit>().logout().then((_) {
                      context.router.replaceAll([const WelcomeRoute()]);
                    });
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
