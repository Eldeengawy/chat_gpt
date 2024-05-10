import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  NetworkInfoImpl(this._connectivity);

  @override
  Future<ConnectivityResult> get isConnected async {
    var connectivityResult = await _connectivity.checkConnectivity();
    // Since checkConnectivity() returns a list, you can choose any one of the results.
    return connectivityResult.isNotEmpty
        ? connectivityResult[0]
        : ConnectivityResult.none;
  }
}
