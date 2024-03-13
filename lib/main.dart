import 'dart:async';
import 'dart:ui';

import '/features/home/presentation/widgets/general_scaffold_home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/core/constants/app_theme.dart';
import '/core/utils/shared_storage.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_settings.dart';
import 'core/notification/notification.dart';
import 'core/widgets/easy_loading.dart';
import 'features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'features/spalsh/presentation/page/splash_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedStorage.init();
  await Messaging.initFCM();


  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());

  runApp(
    EasyLocalization(
      supportedLocales: AppConstant.languages.values.toList(),
      path: 'assets/locales',
      fallbackLocale: const Locale('en'),
      startLocale: Locale(SharedStorage.getLanguage()),
      saveLocale: true,
      child: Phoenix(child: const MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///TODO need to review
  StreamSubscription? _streamSubscription;

  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EasyLoadingClass.getStyleEasyLoading();
    return Theme(
      data: AppTheme.appTheme,
      child: PlatformProvider(

        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          color: Colors.green,
          navigatorKey: Keys.navigatorKey,
          localizationsDelegates: [
            ...context.localizationDelegates,
            SfGlobalLocalizations.delegate,
          ],
          supportedLocales: AppConstant.languages.values.toList(),
          builder: EasyLoading.init(),
          locale: context.locale,
          title: AppSettings.appName,
          home: Splash(navigator: _getNextPage()),
          material: (_, __) => MaterialAppData(
            scrollBehavior: AppScrollBehavior(),
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: AppSettings.isDebug,
          ),
          cupertino: (_, __) => CupertinoAppData(
            scrollBehavior: AppScrollBehavior(),
            theme: AppTheme.appThemeCupertino,
            debugShowCheckedModeBanner: AppSettings.isDebug,
          ),
        ),
      ),
    );
  }

  _getNextPage() {
    if (SharedStorage.hasToken()) {
      return  const GeneralScaffoldHome();
    } else {
      return const OnBoardingPage();
    }
  }
}
