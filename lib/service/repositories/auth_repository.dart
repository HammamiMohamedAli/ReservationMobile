// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable

import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yallaplay_mobile/common/utils.dart';
import 'package:yallaplay_mobile/model/User.dart';
import 'package:yallaplay_mobile/service/api_base_helper.dart';
import 'package:yallaplay_mobile/service/endpoints.dart';
import 'package:yallaplay_mobile/service/exceptions.dart';

class AuthService {
  static User currentUser = User(id: -1);
  final ApiBaseHelper _apiHelper = ApiBaseHelper.shared;
  final _storage = const FlutterSecureStorage();
  Future<User?> Register(Map<String, dynamic> payload, File? userImage) async {
    try {
      var response;
      if (userImage != null) {
        response = await _apiHelper.registerWithImage(
            ApiEndpoints.registerPlayer, payload, userImage,
            needsAuth: false, showLoader: true);
      } else {
        response = await _apiHelper.post(ApiEndpoints.registerPlayer, payload,
            needsAuth: false, showLoader: true);
      }
      if (response.statusCode == 420) {
        Utils.showErrorEmail("Email déjà utilisée!");
        return null;
      } else if (response.statusCode == 201) {
        Utils.showsuccess("Success");
        final responseData = json.decode(response.body);
        final userJson = responseData['data'];
        final user = User.fromJson(userJson);
        await _storage.write(key: 'api_token', value: user.apiToken!);
        currentUser = user;
        return user;
      } else {
        throw Exception("Signup failed: ${response.body}");
      }
    } on FetchDataException catch (e) {
      throw Exception("Error during data fetching: ${e.message}");
    } on BadRequestException catch (e) {
      throw Exception("Bad Request: ${e.message}");
    } on UnauthorisedException catch (e) {
      throw Exception("Unauthorised: ${e.message}");
    } on InvalidInputException catch (e) {
      throw Exception("Invalid Input: ${e.message}");
    } on SessionExpiredException catch (e) {
      throw Exception("Session Expired: ${e.message}");
    } on SocketException {
      throw Exception("Please check your internet connection");
    } catch (e) {
      // throw Exception("An unexpected error occurred: ${e.toString()}");
    }
  }
}
