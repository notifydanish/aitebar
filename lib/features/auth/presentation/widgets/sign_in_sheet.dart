import 'package:auto_route/auto_route.dart';
import 'package:etibaar/core/components/app_button.dart';
import 'package:etibaar/core/components/sb.dart';
import 'package:etibaar/core/constants/app_strings.dart';
import 'package:etibaar/core/extensions/build_context_extension.dart';
import 'package:etibaar/core/mixins/input_formatters.dart';
import 'package:etibaar/core/mixins/validators.dart';
import 'package:etibaar/core/routes/app_routes.dart';
import 'package:etibaar/core/sl/service_locator.dart';
import 'package:etibaar/features/auth/presentation/blocs/auth_form_cubit.dart';
import 'package:etibaar/features/welcome/presentation/blocs/auth/auth_bloc.dart';
import 'package:etibaar/features/welcome/presentation/blocs/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class SignInSheet extends StatelessWidget with Validators, InputFormatter {
  SignInSheet({Key? key}) : super(key: key);
  final _authFormCubit = sl<AuthFormCubit>();
  final _authBloc = sl<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.background.withOpacity(0.6),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          SB.h(16.0),
          Text(
            AppStrings.loginToYourAccount,
            style: context.titleLarge,
          ),
          SB.h(16.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: context.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              children: [
                const Text('${AppStrings.signInWith} email'),
                SB.h(16.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.email, style: context.bodyLarge.copyWith(color: context.primary)),
                ),
                TextFormField(
                  inputFormatters: [noSpaceFormatter],
                  validator: validateEmail,
                  onChanged: _authFormCubit.onChangedEmail,
                ),
                SB.h(16.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.password, style: context.bodyLarge.copyWith(color: context.primary)),
                ),
                BlocSelector<AuthFormCubit, AuthFormState, bool>(
                  bloc: _authFormCubit,
                  selector: (state) => state.passwordObscure,
                  builder: (context, isObscure) {
                    return TextFormField(
                      inputFormatters: [noSpaceFormatter],
                      obscureText: isObscure,
                      obscuringCharacter: AppStrings.obscuringCharacter,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(isObscure ? LineIcons.eye : LineIcons.eyeSlash),
                          onPressed: _authFormCubit.passwordObscureToggle,
                        ),
                      ),
                      validator: validatePassword,
                      onChanged: _authFormCubit.onChangedPassword,
                    );
                  },
                ),
                SB.h(8.0),
                Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text(AppStrings.forgotPassword))),
                SB.h(8.0),
                BlocSelector<AuthFormCubit, AuthFormState, bool>(
                  bloc: _authFormCubit,
                  selector: (_) => _authFormCubit.isValidSignInForm,
                  builder: (context, isValidForm) {
                    debugPrint('SignInSheet.build: $isValidForm');
                    return BlocConsumer<AuthBloc, AuthState>(
                      bloc: _authBloc,
                      listener: (context, state) {
                        state.whenOrNull(
                          success: (state) {
                            sl<UserCubit>().init(state);
                            context.router.pushNamed(AppRoutes.home);
                          },
                          failure: (state) {
                            context.showSnackBar(state);
                          },
                        );
                      },
                      builder: (context, state) {
                        return AppButton.gradient(
                          isProcessing: state == const AuthState.loading(),
                          onPressed: !isValidForm ? null : _attemptSignIn,
                          child: const Text(AppStrings.login),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _attemptSignIn() {
    _authBloc.add(AuthEvent.login(
      email: _authFormCubit.state.email!,
      password: _authFormCubit.state.password!,
    ));
  }
}
