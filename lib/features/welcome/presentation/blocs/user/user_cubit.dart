import 'package:etibaar/core/sl/service_locator.dart';
import 'package:etibaar/features/auth/domain/auth_facade.dart';
import 'package:etibaar/features/auth/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  final IAuthFacade _authFacade = sl<IAuthFacade>();

  UserCubit() : super(const UserInitial());

  void init(AppUser user) {
    emit(UserAuthState(user: user));
  }

  void update(AppUser user) {
    emit(UserAuthState(user: user));
  }

  void reset() {
    emit(const UserInitial());
  }

  Future<void> logout() async {
    await _authFacade.logout();
    emit(const UserInitial());
  }

  bool get isAuthorized {
    return FirebaseAuth.instance.currentUser != null;
  }

  String get uid => FirebaseAuth.instance.currentUser!.uid;
}
