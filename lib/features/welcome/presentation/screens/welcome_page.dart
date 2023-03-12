import 'dart:math';

import 'package:aitebar/core/components/app_button.dart';
import 'package:aitebar/core/components/sb.dart';
import 'package:aitebar/core/constants/app_strings.dart';
import 'package:aitebar/core/extensions/build_context_extension.dart';
import 'package:aitebar/core/routes/app_router.gr.dart';

// import 'package:aitebar/core/routes/app_router.gr.dart';
import 'package:aitebar/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('WelcomeScreen.build');
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(gradient: context.vertical),
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: min(400.0, context.width),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  child: SvgPicture.asset(
                    Assets.svg.treesAndCloud,
                    height: (context.height * 0.7),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    // decoration: BoxDecoration(gradient: context.vertical),
                    padding: const EdgeInsets.all(12.0),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: min(400.0, context.width),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppButton(
                            child: const Text(AppStrings.login),
                            onPressed: () => context.router.navigate(SignInRoute()),
                          ),
                          SB.h(24.0),
                          AppButton(
                            child: const Text(AppStrings.signUp),
                            onPressed: () => context.router.navigate(SignUpRoute()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
