import 'package:chat_gpt/app.dart';
import 'package:chat_gpt/core/observers/bloc_observer.dart';
import 'package:chat_gpt/core/services/di.dart';
import 'package:chat_gpt/core/static/locales.dart';
import 'package:chat_gpt/core/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Initialize the dependency injection container
  await initLocator();

  Bloc.observer = MyBlocObserver();

  // Get the language code from MohmtyPreferences
  // final codeLang = sl<MohmtyPreferences>().getLang();
  runApp(
      // DevicePreview(builder: (BuildContext context) {
      // return
      EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [
            Locales.arabic,
            Locales.english,
          ],
          startLocale: Locales.english,
          fallbackLocale: Locales.arabic,
          useOnlyLangCode: true,
          assetLoader: const CodegenLoader(),
          child: ChatGPT())
      // ;
      // }
      // )
      );
}
