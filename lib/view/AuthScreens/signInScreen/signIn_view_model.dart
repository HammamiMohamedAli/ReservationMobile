// ignore_for_file: non_constant_identifier_names, file_names, camel_case_types

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yallaplay_mobile/common/utils.dart';
import 'package:yallaplay_mobile/model/User.dart';

class signInState {
  bool isPasswordVisible = false;
}

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  return SignInViewModel();
});

class SignInViewModel extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  // bool _isLoading = false;

  // bool get isLoading => _isLoading;
  final signInState _state = signInState();
  signInState get state => _state;

  void togglePasswordVisibility() {
    _state.isPasswordVisible = !_state.isPasswordVisible;
    notifyListeners();
  }

  static User currentUser = User(id: -1);
  Future<User?> signIn(String email, String password,
      {bool needsAuth = false, showLoader = false}) async {
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }

    final url =
        Uri.parse('http://51.210.254.4/api/v1/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final userJson = responseData['data'];
        final user = User.fromJson(userJson);
        print(user);
        if (kDebugMode) {
          print(user);
        }
        await _storage.write(key: 'api_token', value: user.apiToken!);
        currentUser = user;
        Utils.showsuccess("login Sucess");
        return user;
      } else if (response.statusCode == 422) {
        Utils.showErrorEmail("incorrect user");
        return null;
      } else {
        Utils.showError("failed to login");
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }
}

/*static User currentUser = User(id: -1);
  Future<User?> signIn(String email, String password,
      {bool needsAuth = false, showLoader = false}) async {
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    // _isLoading = true;
    final url =
        Uri.parse('https://3be7-197-2-227-167.ngrok-free.app/api/v1/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final responseData = json.decode(response.body);
        print(responseData);
        // Assuming the token is returned in a field named 'token'
        final String? token = responseData['data']['api_token'];
        if (token != null && token.isNotEmpty) {
          await _storage.write(key: 'api_token', value: token);
          User user = User(
            id: responseData['data']['id'],
            // Set other fields accordingly
          );
          Utils.showsuccess("login Sucess");
          currentUser = user;
          print(user);
          return user;
        } else {
          if (kDebugMode) {
            print('Token not found in response : ${response.body}');
            Utils.showError("Token not found");
          }
          //   _isLoading = false;
          return User(id: -1);
        }
      } else if (response.statusCode == 422) {
        Utils.showErrorEmail("incorrect user");
        return User(id: -1);
      } else {
        if (kDebugMode) {
          Utils.showError("failed to login");
          print(
              'Failed to login with status code ${response.statusCode} : ${response.body}');
        }
        //  _isLoading = false;
        return User(id: -1);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
      //   _isLoading = false;
      return User(id: -1);
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'api_token');
  }
}*/

// Provider for managing the obscureText state
final obscureTextProvider = StateProvider<bool>((ref) => true);
