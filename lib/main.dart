import 'package:chat_gpt/app.dart';
import 'package:chat_gpt/core/observers/bloc_observer.dart';
import 'package:chat_gpt/core/services/di.dart';
import 'package:chat_gpt/core/static/constants.dart';
import 'package:chat_gpt/core/static/locales.dart';
import 'package:chat_gpt/core/translations/codegen_loader.g.dart';
import 'package:chat_gpt/features/chat/data/models/message.dart';
import 'package:chat_gpt/features/drawer/data/models/chat.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Initialize the dependency injection container
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  // await ThemeManager.init();

  // Register Hive Adapters
  Hive.registerAdapter(ChatAdapter());
  Hive.registerAdapter(MessageAdapter());
  await Hive.openBox(Constants.KChatBox);
  await Hive.openBox(Constants.KMessageBox);
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
