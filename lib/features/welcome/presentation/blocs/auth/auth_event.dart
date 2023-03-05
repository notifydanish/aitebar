part of 'auth_bloc.dart';

/*
@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;

  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({required this.name, required this.email, required this.password});
}

class FetchUserEvent extends AuthEvent {
  final String uid;

  FetchUserEvent({required this.uid});
}
*/

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUp({
    required final String name,
    required final String email,
    required final String password,
  }) = _SignUp;

  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;

  const factory AuthEvent.fetchUser({
    required String uid,
  }) = _FetchUser;
}
