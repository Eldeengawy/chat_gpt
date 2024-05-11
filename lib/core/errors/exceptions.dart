import 'package:chat_gpt/core/errors/app_exception.dart';
import 'package:chat_gpt/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// class NoInternetException extends AppException {
//   NoInternetException() : super(LocaleKeys.no_internet_failure.tr());
// }

class NoTokenException extends AppException {
  NoTokenException() : super("Auth token expected, none recieved.");
}

class AutoLoginException extends AppException {
  AutoLoginException() : super("No token is saved locally");
}

class LoginException extends AppException {
  final String code;

  LoginException(this.code) : super(code.tr());
}

class UnsupportedImageTypeException extends AppException {
  UnsupportedImageTypeException() : super("Unsupported Image Type.");
}

class UnauthenticatedException extends AppException {
  UnauthenticatedException() : super("User Unauthenticated");
}

// class BadInputException extends AppException {
//   final Map<String, ResponseCode> errors;
//   BadInputException(this.errors) : super(LocaleKeys.BAD_INPUT);
// }

class ServerException extends AppException {
  ServerException() : super("Something went wrong");
}
