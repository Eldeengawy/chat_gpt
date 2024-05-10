import 'package:chat_gpt/core/api/dio_client.dart';
import 'package:chat_gpt/core/connection/network_info.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  //? Cubits
  // sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  // sl.registerFactory<ChangeProfileImageCubit>(
  //     () => ChangeProfileImageCubit(authRepository: sl()));

  //* Repository
  // sl.registerLazySingleton<AuthRepository>(
  //     () => AuthRepositoryImpl(sl(), sl(), sl()));
  // sl.registerLazySingleton<BoardRepository>(
  //   () => BoardRepositoryImpl(sl(), sl(), sl()));
  // sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
  //       sl(),
  //       sl(),
  //     ));
  // sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
  //       sl(),
  //       sl(),
  //     ));
  // sl.registerLazySingleton<CreateTaskRepository>(() => CreateTaskRepositoryImpl(
  //       sl(),
  //       sl(),
  // ));
  // sl.registerLazySingleton<DoctorLecturesRepository>(
  //     () => DoctorLecturesRepositoryImpl(lecturesDataSource: sl()));
  // sl.registerLazySingleton<DoctorExamsRepository>(
  //     () => DoctorExamsRepositoryImpl(examsDataSource: sl()));
  // sl.registerLazySingleton<StudentLecturesRepository>(
  //     () => StudentLecturesRepositoryImpl(lecturesDataSource: sl()));
  // sl.registerLazySingleton<StudentExamsRepository>(
  //     () => StudentExamsRepositoryImpl(examsDataSource: sl()));
  // sl.registerLazySingleton<StudentGradesRepository>(
  //     () => StudentGradesRepositoryImpl(gradesDataSource: sl()));
  // sl.registerLazySingleton<ChatsRepository>(
  //     () => ChatsRepositoryImpl(chatsDataSource: sl()));
  // sl.registerLazySingleton<FcmRepository>(() => FcmRepositoryImpl(sl(), sl()));

  // //* Datasources
  // sl.registerLazySingleton<AuthDataSource>(
  //     () => AuthDataSourceImpl(sl(), sl()));
  // sl.registerLazySingleton<BoardDataSource>(() => BoardDataSourceImpl(sl()));
  // sl.registerLazySingleton<ProfileDataSource>(
  //     () => ProfileDataSourceImpl(sl()));
  // sl.registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl(sl()));
  // sl.registerLazySingleton<CreateTaskDataSource>(
  //     () => CreateTaskDataSourceImpl(sl()));
  // sl.registerLazySingleton<FcmDataSource>(() => FcmDataSourceImpl(sl()));
  // sl.registerLazySingleton<DoctorLecturesDataSource>(
  //     () => DoctorLecturesDataSourceImpl());
  // sl.registerLazySingleton<DoctorExamsDataSource>(
  //     () => DoctorExamsDataSourceImpl());
  // sl.registerLazySingleton<StudentLecturesDataSource>(
  //     () => StudentLecturesDataSourceImpl());
  // sl.registerLazySingleton<StudentExamsDataSource>(
  //     () => StudentExamsDataSourceImpl());
  // sl.registerLazySingleton<StudentGradesDataSource>(
  //     () => StudentGradesDataSourceImpl());
  // sl.registerLazySingleton<ChatsDataSource>(() => ChatsDataSourceImpl());

  //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton<DioClient>(() => DioClient());
  // Register FcmService as a lazy singleton
  // sl.registerLazySingleton<FcmService>(() => FcmService());
  //! External
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Connectivity());
}
