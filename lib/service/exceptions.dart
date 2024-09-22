class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;

  AppException([this.message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class SessionExpiredException extends AppException {
  SessionExpiredException([message]) : super(message, "SessionExpired: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class RegisterIncompleteException extends AppException {
  RegisterIncompleteException([String? message])
      : super(message, "Invalid Input: ");
}

class InvalidRequestException extends AppException {
  InvalidRequestException([String? message])
      : super(message, "Invalid Request");
}

class AppExceptionResponse {
  String title = "";
  String detail = "";
  String statut = "";
  String message = "";
  AppExceptionResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "title";
    statut = json['statut'] ?? "";
    message = json["message"] ?? "";
    statut = json['statut'] ?? "";
  }
}
