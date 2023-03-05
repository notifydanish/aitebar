import 'dart:math';

import 'package:etibaar/core/components/app_button.dart';
import 'package:etibaar/core/components/sb.dart';
import 'package:etibaar/core/constants/app_strings.dart';
import 'package:etibaar/core/extensions/build_context_extension.dart';
import 'package:etibaar/features/auth/presentation/widgets/sign_in_sheet.dart';
import 'package:etibaar/features/auth/presentation/widgets/sign_up_sheet.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Container(
          decoration: BoxDecoration(gradient: context.vertical),
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: min(400.0, context.width),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppButton(child: const Text(AppStrings.login), onPressed: () => _signInView(context)),
                SB.h(24.0),
                AppButton(child: const Text(AppStrings.signUp), onPressed: () => _signUpView(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInView(BuildContext context) {
    context.showBottomSheet(
      SignInSheet(),
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    );
  }

  void _signUpView(BuildContext context) {
    context.showBottomSheet(
      SignUpSheet(),
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    );
  }
}
