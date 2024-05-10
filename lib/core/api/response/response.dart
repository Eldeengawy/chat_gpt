// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part "response.g.dart";
part 'response_codes.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false,
  createFactory: false,
)
sealed class ApiResponse<T> {
  final ResponseCode code;

  ApiResponse({required this.code});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    if (json["code"] == ResponseCode.SUCCESS.name) {
      if (json["token"] != null) {
        return TokenResponse<T>.fromJson(json, fromJsonT);
      } else {
        return SuccessResponse<T>.fromJson(json, fromJsonT);
      }
    } else {
      if (json["code"] == ResponseCode.BAD_INPUT.name) {
        return BadInputResponse<T>.fromJson(json);
      } else {
        return ErrorResponse<T>.fromJson(json);
      }
    }
  }
}

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class SuccessResponse<T> extends ApiResponse<T> {
  final T data;
  SuccessResponse({
    required super.code,
    required this.data,
  });

  factory SuccessResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$SuccessResponseFromJson(json, fromJsonT);
}

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class TokenResponse<T> extends SuccessResponse<T> {
  final String token;

  TokenResponse({
    required super.code,
    required super.data,
    required this.token,
  });

  factory TokenResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$TokenResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class ErrorResponse<T> extends ApiResponse<T> {
  ErrorResponse({required super.code});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class BadInputResponse<T> extends ErrorResponse<T> {
  @JsonKey(name: "Errors")
  final Map<String, ResponseCode> errors;

  BadInputResponse({required this.errors})
      : super(code: ResponseCode.BAD_INPUT);

  factory BadInputResponse.fromJson(Map<String, dynamic> json) =>
      _$BadInputResponseFromJson(json);
}
