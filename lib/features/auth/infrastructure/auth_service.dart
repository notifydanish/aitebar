import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aitebar/core/constants/firebase_key.dart';
import 'package:aitebar/features/auth/domain/auth_facade.dart';
import 'package:aitebar/features/auth/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IAuthFacade)
class AuthService extends IAuthFacade {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<dynamic> signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e, stackTrace) {
      debugPrint('AuthService.login: $e, $stackTrace');
      return e.message;
    } catch (e, stackTrace) {
      debugPrint('AuthService.login: $e $stackTrace');
      return e;
    }
  }

  @override
  Future<dynamic> login({required String email, required String password}) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e, stackTrace) {
      debugPrint('AuthService.login: $e, $stackTrace');
      return e.message;
    } catch (e, stackTrace) {
      debugPrint('AuthService.login: $e $stackTrace');
      return e.toString();
    }
  }

  @override
  Future<dynamic> createUser({required String id, required Map<String, dynamic> map}) async {
    try {
      await _firestore.collection(FirebaseKey.users).doc(id).set(map);
      return;
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e, $stackTrace');
      return e.message;
    } catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e $stackTrace');
      return e.toString();
    }
  }

  @override
  Future<dynamic> updateUser({required AppUser user}) async {
    try {
      await _firestore.collection(FirebaseKey.users).doc(user.uid).update(user.toJson());
      return;
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e, $stackTrace');
      return e.message;
    } catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e $stackTrace');
      return e.toString();
    }
  }

  @override
  Future logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<dynamic> getUser({required String uid}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await _firestore.collection(FirebaseKey.users).doc(uid).get();
      if (doc.exists && (doc.data()?.isNotEmpty ?? false)) {
        Map<String, dynamic> data = doc.data()!;
        return AppUser.fromJson(data);
      } else {
        return 'User not found';
      }
    } on FirebaseException catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e, $stackTrace');
      return e.message;
    } catch (e, stackTrace) {
      debugPrint('AuthService.createUser: $e $stackTrace');
      return e.toString();
    }
  }
}
