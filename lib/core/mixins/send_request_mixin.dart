import 'package:chat_gpt/core/api/response/response.dart';
import 'package:chat_gpt/core/connection/network_info.dart';
import 'package:chat_gpt/core/errors/app_exception.dart';
import 'package:chat_gpt/core/errors/exceptions.dart';
import 'package:chat_gpt/core/services/di.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

mixin SendRequestMixin {
  Future<T> sendRequest<T>(
    Future<ApiResponse<T>> Function() request,
  ) async {
    final networkInfo = sl<NetworkInfo>();
    // if (await networkInfo.isConnected == ConnectivityResult.none) {
    //   throw NoInternetException();
    // }

    var response = await request();

    // if (response is BadInputResponse<T>) {
    //   throw BadInputException(response.errors);
    // }

    if (response is ErrorResponse<T>) {
      throw AppException(response.code.message);
    }

    response = response as SuccessResponse<T>;

    return response.data;
  }
}
