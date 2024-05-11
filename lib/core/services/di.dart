import 'package:chat_gpt/core/api/dio_client.dart';
import 'package:chat_gpt/core/connection/network_info.dart';
import 'package:chat_gpt/features/chat/data/datasources/locale_datasource/chats_local_data_source.dart';
import 'package:chat_gpt/features/chat/data/datasources/locale_datasource/chats_local_data_source_impl.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_datasource/chat_remote_data_source.dart';
import 'package:chat_gpt/features/chat/data/datasources/remote_datasource/chat_remote_data_source_impl.dart';
import 'package:chat_gpt/features/chat/data/repositories/chats_repo_impl.dart';
import 'package:chat_gpt/features/chat/domain/repositories/chats_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  //? Cubits

  //* Repository
  sl.registerLazySingleton<ChatsRepo>(() => ChatsRepoImpl(sl(), sl()));

  // //* Datasources
  sl.registerLazySingleton<ChatsRemoteDataSource>(
      () => ChatsRemoteDataSourceImpl());
  sl.registerLazySingleton<ChatsLocalDataSource>(
      () => ChatsLocalDataSourceImpl());

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton<DioClient>(() => DioClient());

  //! External
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => Connectivity());
}
