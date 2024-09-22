// ignore_for_file: file_names, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/service/repositories/auth_repository.dart';

class SignUpState {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isMaleSelected = true;
  String get gender => isMaleSelected ? 'male' : 'female';
  File? userImage;

  void reset() {
    isMaleSelected = true;
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    userImage = null;
  }
}

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel(AuthService());
});

class SignUpViewModel extends ChangeNotifier {
  final SignUpState _state = SignUpState();
  SignUpState get state => _state;
  //final ApiBaseHelper _apiHelper = ApiBaseHelper.shared;
  late final AuthService _authService;
  SignUpViewModel(this._authService);

  void togglePasswordVisibility() {
    _state.isPasswordVisible = !_state.isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _state.isConfirmPasswordVisible = !_state.isConfirmPasswordVisible;
    notifyListeners();
  }

  void toggleGender(bool isMale) {
    _state.isMaleSelected = isMale;
    notifyListeners();
  }

  void resetState() {
    _state
        .reset(); // Implement a reset method in SignUpModel to reset its state
    notifyListeners();
  }

  bool isValidEmail(String email) {
    // Use a regular expression for basic email validation
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  Future<bool> signUp(
      BuildContext context, Map<String, dynamic> payload) async {
    try {
      var user = await _authService.Register(payload, _state.userImage);
     if (user != null && user.id != null) {
        Navigator.of(context).pushReplacementNamed('/section');
        _state.reset();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _showError(context, e.toString());
      return false;
    }
  }
}

void _showError(BuildContext context, String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
