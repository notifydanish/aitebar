part of 'auth_bloc.dart';

// @immutable
// abstract class AuthState {}
//
// class AuthInitial extends AuthState {}
//
// class AuthLoading extends AuthState {}
//
// class AuthSuccess extends AuthState {
//   final AppUser user;
//
//   AuthSuccess({required this.user});
// }
//
// class AuthFailure extends AuthState {
//   final String message;
//
//   AuthFailure({required this.message});
// }


@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success({required AppUser user}) = _Success;

  const factory AuthState.failure({required String message}) = _Failure;
}
