// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse<T> _$SuccessResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    SuccessResponse<T>(
      code: $enumDecode(_$ResponseCodeEnumMap, json['code']),
      data: fromJsonT(json['data']),
    );

const _$ResponseCodeEnumMap = {
  ResponseCode.SUCCESS: 'SUCCESS',
  ResponseCode.BAD_INPUT: 'BAD_INPUT',
  ResponseCode.REQUIRED_NAME: 'REQUIRED_NAME',
  ResponseCode.REQUIRED_EMAIL: 'REQUIRED_EMAIL',
  ResponseCode.INVALID_EMAIL: 'INVALID_EMAIL',
  ResponseCode.EMAIL_MUST_BE_UNIQUE: 'EMAIL_MUST_BE_UNIQUE',
  ResponseCode.REQUIRED_PASSWORD: 'REQUIRED_PASSWORD',
  ResponseCode.PLEASE_CONFIRM_PASSWORD: 'PLEASE_CONFIRM_PASSWORD',
  ResponseCode.REQUIRED_PHOTO: 'REQUIRED_PHOTO',
  ResponseCode.PHOTO_MUST_BE_PNG_JPG_WEBP: 'PHOTO_MUST_BE_PNG_JPG_WEBP',
  ResponseCode.ORGANIZATION_PHOTO_MUST_BE_PNG_JPG_WEBP:
      'ORGANIZATION_PHOTO_MUST_BE_PNG_JPG_WEBP',
  ResponseCode.REQUIRED_ROLE: 'REQUIRED_ROLE',
  ResponseCode.ROLE_MUST_BE_MANAGER_OR_EMPLOYEE:
      'ROLE_MUST_BE_MANAGER_OR_EMPLOYEE',
  ResponseCode.NOT_EXISTS_EMAIL: 'NOT_EXISTS_EMAIL',
  ResponseCode.REQUIRED_CODE: 'REQUIRED_CODE',
  ResponseCode.WRONG_CREDS: 'WRONG_CREDS',
  ResponseCode.WRONG_OLD_PASSWORD: 'WRONG_OLD_PASSWORD',
  ResponseCode.REQUIRED_OLD_PASSWORD: 'REQUIRED_OLD_PASSWORD',
  ResponseCode.REQUIRED_CREATED_AT: 'REQUIRED_CREATED_AT',
  ResponseCode.REQUIRED_ORGANIZATION_ID: 'REQUIRED_ORGANIZATION_ID',
  ResponseCode.REQUIRED_DESCRIPTION: 'REQUIRED_DESCRIPTION',
  ResponseCode.REQUIRED_DEADLINE: 'REQUIRED_DEADLINE',
  ResponseCode.REQUIRED_USER_IDS: 'REQUIRED_USER_IDS',
  ResponseCode.REQUIRED_TITLE: 'REQUIRED_TITLE',
  ResponseCode.REQUIRED_CATEGORY: 'REQUIRED_CATEGORY',
  ResponseCode.ORGANIZATION_CODE_NOT_FOUND: 'ORGANIZATION_CODE_NOT_FOUND',
  ResponseCode.NOT_VERIFIED: 'NOT_VERIFIED',
  ResponseCode.WRONG_OTP: 'WRONG_OTP',
};

TokenResponse<T> _$TokenResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TokenResponse<T>(
      code: $enumDecode(_$ResponseCodeEnumMap, json['code']),
      data: fromJsonT(json['data']),
      token: json['token'] as String,
    );

ErrorResponse<T> _$ErrorResponseFromJson<T>(Map<String, dynamic> json) =>
    ErrorResponse<T>(
      code: $enumDecode(_$ResponseCodeEnumMap, json['code']),
    );

BadInputResponse<T> _$BadInputResponseFromJson<T>(Map<String, dynamic> json) =>
    BadInputResponse<T>(
      errors: (json['Errors'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$ResponseCodeEnumMap, e)),
      ),
    );
