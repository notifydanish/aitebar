import 'package:aitebar/features/auth/domain/models/user/user.dart';

abstract class IAuthFacade {
  Future<dynamic> login({required String email, required String password});

  Future<dynamic> signUp({required String email, required String password});

  Future<dynamic> createUser({required String id, required Map<String, dynamic> map});

  Future<dynamic> updateUser({required AppUser user});

  Future<dynamic> getUser({required String uid});

  Future<dynamic> logout();
}
