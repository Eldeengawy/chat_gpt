import 'dart:developer';

import 'package:chat_gpt/core/api/end_points.dart';
import 'package:chat_gpt/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      // contentType: 'application/json',
      baseUrl: EndPoints.baseUrl,
      followRedirects: false,
      headers: {"Accept": "application/json"},
    ),
  )..interceptors.add(
      PrettyDioLogger(
        // Add PrettyDioLogger interceptor here
        error: true,
        request: true,
        logPrint: (message) {
          log(message.toString());
        },
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
        maxWidth: 90,
      ),
    );

  Future<Map<String, dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _sendRequest(
      () => _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
    );
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _sendRequest(
      () => _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
    );
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _sendRequest(
      () => _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
    );
  }

  //Delete
  Future<Map<String, dynamic>> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _sendRequest(
      () => _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      ),
    );
  }

  Future<Map<String, dynamic>> _sendRequest(
    Future<Response> Function() request,
  ) async {
    late final Response response;
    try {
      response = await request();
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        log("$e");
        throw ServerException();
      }
    }
    return response.data ?? {};
  }
}
