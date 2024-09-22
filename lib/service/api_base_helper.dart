// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_catch_clause

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:yallaplay_mobile/service/exceptions.dart';
import 'dart:async';
import '../common/utils.dart';

class ApiBaseHelper {
  final String _apiBaseUrl = "http://51.210.254.4/api/v1";

  late Map<String, String> _headers;

  static ApiBaseHelper shared = ApiBaseHelper();

  _showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  final _storage = const FlutterSecureStorage();
  _initiateHeaders({bool needsAuth = true}) async {
    _headers = {};
    if (needsAuth) {
      _headers = {
        "Authorization": "Bearer ${await _storage.read(key: 'api_token')}"
      };
    }
    _headers["content-type"] = "application/json";
    _headers["Accept"] = "application/json";

    final selectedSport = await _storage.read(key: 'selected_sport');
    if (selectedSport != null) {
      _headers["activity-type"] = selectedSport.toLowerCase();
    }
  }

  Future<dynamic> get(String url,
      {bool needsAuth = true, bool showLoader = false}) async {
    var responseJson;

    await _initiateHeaders(needsAuth: needsAuth);
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    try {
      final response =
          await http.get(Uri.parse(_apiBaseUrl + url), headers: _headers);
      if (kDebugMode) {
        print("url is : $_apiBaseUrl$url");
        print("response is : ${response.body}");
      }
      responseJson = _returnResponse(response);
      Utils.dismissLoader();
    } on SocketException {
      _showErrorToast("Pas de connexion internet.");
      Utils.dismissLoader();
      throw FetchDataException('Pas de connexion internet.');
    } on InvalidInputException catch (e) {
      Utils.dismissLoader();
      _showErrorToast("Vérifiez les champs");
    } on SessionExpiredException catch (e) {
      Utils.dismissLoader();
      throw SessionExpiredException(e);
    } catch (e) {
      Utils.dismissLoader();
    }
    Utils.dismissLoader();
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {bool needsAuth = true, bool showLoader = false}) async {
    var responseJson;
    await _initiateHeaders(needsAuth: needsAuth);
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    try {
      final response =
          await http.delete(Uri.parse(_apiBaseUrl + url), headers: _headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      _showErrorToast("Pas de connexion internet.");
      throw FetchDataException('Pas de connexion internet.');
    } on InvalidInputException catch (e) {
      _showErrorToast("Vérifiez les champs");
    } on SessionExpiredException catch (e) {
      throw SessionExpiredException(e);
    } catch (e) {
      _showErrorToast("Erreur de connexion");
    }
    return responseJson;
  }

  Future<dynamic> post(String endpoint, dynamic rBody,
      {bool needsAuth = true, showLoader = false}) async {
    var responseJson;
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    await _initiateHeaders(needsAuth: needsAuth);
    try {
      final response = await http.post(Uri.parse(_apiBaseUrl + endpoint),
          body: json.encode(rBody), headers: _headers);
      if (kDebugMode) {
        print("url is : $endpoint");
      }
      if (kDebugMode) {
        print("response is : ${response.body}");
      }
      responseJson = _returnResponse(response);
      if (kDebugMode) {
        print(response.reasonPhrase);
        print(response.statusCode);
      }
      Utils.dismissLoader();
    } on AppException catch (exception) {
      Utils.dismissLoader();
      AppExceptionResponse error = AppExceptionResponse.fromJson(
          json.decode(exception.message.toString()));
      return error;
    }
    Utils.dismissLoader();
    return responseJson;
  }

  Future<dynamic> registerWithImage(
      String endpoint, Map<String, dynamic> userData, File imageFile,
      {bool needsAuth = false, showLoader = false}) async {
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    var uri = Uri.parse(_apiBaseUrl + endpoint);
    var request = http.MultipartRequest('POST', uri);
    _initiateHeaders(
        needsAuth: false); // Assuming registration doesn't need auth
    request.headers.addAll(_headers);
    // Add user data to the request
    userData.forEach((key, value) {
      request.fields[key] = value.toString();
    });
    // Add image file to the request
    var pic = await http.MultipartFile.fromPath(
        'avatar',
        imageFile
            .path); // 'avatar' should match the field name expected by the server
    request.files.add(pic);
    // Send the request
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return _returnResponse(response);
  }

  Future<dynamic> put(String url, dynamic body,
      {bool needsAuth = true, showLoader = false}) async {
    var responseJson;
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    await _initiateHeaders(needsAuth: needsAuth);

    try {
      final response = await http.put(Uri.parse(_apiBaseUrl + url),
          body: json.encode(body), headers: _headers);
      if (kDebugMode) {
        print("url is : $url");
        print("payload is : ${json.encode(body)}");
        print("response is : ${response.body}");
      }

      Utils.dismissLoader();
      responseJson = _returnResponse(response);
    } on SocketException {
      Utils.dismissLoader();
      _showErrorToast("Pas de connexion internet.");
      throw FetchDataException('Pas de connexion internet.');
    } on InvalidInputException catch (e) {
      Utils.dismissLoader();
      _showErrorToast("Vérifiez les champs");
    } catch (e) {
      Utils.dismissLoader();
      if (kDebugMode) {
        print(json.encode(e));
      }
      _showErrorToast("Erreur de connexion.");
    }

    Utils.dismissLoader();
    return responseJson;
  }

  Future<dynamic> patch(String url, dynamic body,
      {bool needsAuth = true, showLoader = false}) async {
    var responseJson;
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    await _initiateHeaders(needsAuth: needsAuth);

    try {
      final response = await http.patch(Uri.parse(_apiBaseUrl + url),
          body: json.encode(body), headers: _headers);
      if (kDebugMode) {
        print("url is : $url");
        print("payload is : ${json.encode(body)}");
        print("response is : ${response.body}");
      }

      Utils.dismissLoader();
      responseJson = _returnResponse(response);
    } on SocketException {
      Utils.dismissLoader();
      _showErrorToast("Pas de connexion internet.");
      throw FetchDataException('Pas de connexion internet.');
    } on InvalidInputException catch (e) {
      Utils.dismissLoader();
      _showErrorToast("Vérifiez les champs");
    } catch (e) {
      Utils.dismissLoader();
      if (kDebugMode) {
        print(json.encode(e));
      }
      _showErrorToast("Erreur de connexion.");
    }
    Utils.dismissLoader();
    return responseJson;
  }

  Future<bool> asyncFileUpload(String url, File file,
      {String path = "avatar", showLoader = false}) async {
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    await _initiateHeaders(needsAuth: true);

    var request = http.MultipartRequest(
      "POST",
      Uri.parse(_apiBaseUrl + url),
    );
    request.headers.addAll(_headers);
    var pic = await http.MultipartFile.fromPath(path, file.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    Utils.dismissLoader();
    if (responseString != null) {
      Utils.dismissLoader();
      return true;
    } else {
      Utils.dismissLoader();
      return false;
    }
  }

  Future<bool> asyncFilesUpload(String url, List<File> file,
      {String path = "photos", showLoader = false}) async {
    if (showLoader) {
      Utils.showLoader("Chargement...");
    }
    await _initiateHeaders(needsAuth: true);

    var request = http.MultipartRequest(
      "POST",
      Uri.parse(_apiBaseUrl + url),
    );
    request.headers.addAll(_headers);
    for (int i = 0; i < file.length; i++) {
      request.files.add(
        http.MultipartFile(
            'attachments[]',
            File(file[i].path).readAsBytes().asStream(),
            File(file[i].path).lengthSync(),
            filename: file[i].path.split("/").last),
      );
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    Utils.dismissLoader();
    if (responseString != null) {
      Utils.dismissLoader();
      return true;
    } else {
      Utils.dismissLoader();
      return false;
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 204:
        return response;
      case 302:
        return Fluttertoast.showToast(
          msg: InvalidInputException(response.body.toString()).toString(),
        );
      case 400:
        return Fluttertoast.showToast(
          msg: InvalidInputException(response.body.toString()).toString(),
        );
      case 401:
        return Fluttertoast.showToast(
          msg: InvalidInputException(response.body.toString()).toString(),
        );
      // case 403:
      //   return Fluttertoast.showToast(
      //     msg: InvalidInputException(response.body.toString()).toString(),
      //   );
      case 422:
        return response;
      case 420:
        return Utils.showErrorEmail("Email déjà utilisée!");
      // return _showErrorEmail("Email déjà utilisée");
      case 500:
        return Fluttertoast.showToast(
          msg: InvalidInputException(response.body.toString()).toString(),
        );
      default:
        if (kDebugMode) {
          print("error server ${response.statusCode}");
        }
    }
  }
}
