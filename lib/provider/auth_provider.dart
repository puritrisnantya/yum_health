import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yum_health/data/database/auth/auth_service.dart';
import 'package:yum_health/data/model/user_model.dart';
import 'package:yum_health/helper/state_helper.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService;
  AuthProvider({required this.authService}) {
    _authentication();
  }

  late ResultState _state;
  ResultState get state => _state;
  late bool _isSignIn;
  bool get isSignIn => _isSignIn;
  late DataUser _user;
  DataUser get user => _user;

  _authentication() async {
    _state = ResultState.loading;
    notifyListeners();
    final userStatus = authService.getUserId();
    if (userStatus != null) {
      _isSignIn = userStatus;
      getUserData(authService.auth.currentUser!.uid);
    }
  }

  Future<String> signUp(String username, String email, String password) async {
    try {
      final result = await authService.signUp(username, email, password);
      _authentication();
      if (result != null) {
        getUserData(result);
        return "isSuccess";
      } else {
        return "isError";
      }
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return e.toString();
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      final result = await authService.signIn(email, password);
      _authentication();
      if (result != null) {
        getUserData(result);
        return "isSuccess";
      } else {
        return "isError";
      }
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return e.toString();
    }
  }

  signOut() async {
    await authService.signOut();
    _authentication();
  }

  Future<void> getUserData(String uid) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      var user = await authService.getUserData(uid);
      _user = user!;
      _state = ResultState.hasData;
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
    }
  }
}
