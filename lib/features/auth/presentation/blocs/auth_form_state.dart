part of 'auth_form_cubit.dart';

@immutable
abstract class AuthFormState {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final bool passwordObscure;
  final bool confirmPasswordObscure;

  const AuthFormState({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.passwordObscure = true,
    this.confirmPasswordObscure = true,
  });

  AuthFormState copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? passwordObscure,
    bool? confirmPasswordObscure,
  });
}

class AuthFormUpdate extends AuthFormState {
  const AuthFormUpdate({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? passwordObscure,
    bool? confirmPasswordObscure,
  }) : super(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          passwordObscure: passwordObscure ?? true,
          confirmPasswordObscure: confirmPasswordObscure ?? true,
        );

  @override
  AuthFormUpdate copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? passwordObscure,
    bool? confirmPasswordObscure,
  }) {
    return AuthFormUpdate(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passwordObscure: passwordObscure ?? this.passwordObscure,
      confirmPasswordObscure: confirmPasswordObscure ?? this.confirmPasswordObscure,
    );
  }
}
