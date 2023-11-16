// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:android_project/app/page/app/app_vm.dart';
import 'package:android_project/core/base/base_widget.dart';
import 'package:android_project/core/res/theme.dart';
import 'package:android_project/route.dart';
import 'package:android_project/route.routes.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends BaseState<AppViewModel, MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sıcaklık ölçer",
      theme: AppTheme.theme(isDark: viewModel.isDark),
      initialRoute: RouteMaps.homeRoute,
      onGenerateRoute: onGenerateRoute,
      locale: const Locale('tr'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (
        locale,
        supportedLocales,
      ) {
        Intl.defaultLocale = locale?.languageCode;
        return locale;
      },
    );
  }
}
