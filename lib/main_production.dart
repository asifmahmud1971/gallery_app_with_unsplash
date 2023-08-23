import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:unsplash_gallery/core/app_bloc_observer.dart';

import 'core/app/app.dart';
import 'core/app/app_dependency.dart';
import 'core/app/app_flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Init easyLocalization
  await EasyLocalization.ensureInitialized();
  //Init modules
  configureInjection();
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.production;
  EasyLoading.instance..userInteractions = false;
  await dotenv.load(fileName: "assets/.env");
  //Init my app with observer
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      saveLocale: true,
      path: 'assets/translations',
      child: const InitApp(),
    ),
  );
}
