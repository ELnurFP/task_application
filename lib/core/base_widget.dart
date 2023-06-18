import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_app/common/language_drop_down.dart';

import 'package:task_list_app/constanst/app_size.dart';
import 'package:task_list_app/service/lang_service/lang_notifier.dart';
import 'package:task_list_app/service/lang_service/lang_service.dart';

import '../l10n/app_localizations.dart';
import '../routing/app_routing.dart';

class BaseWidget extends ConsumerWidget {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final goRouter = ref.watch(goRouterProvider);

    ref.watch(languageProvider.select((state) => state is LanguageChanged));
    ref.listen(languageProvider, (previous, current) {
      if (current is LanguageError) {
        print(current.message.toString());
      }
    });
    final AppLanguages? currentlang =
        ref.watch(languageProvider.notifier).appLanguages;

    return ScreenUtilInit(
        designSize: Sizes.designSize,
        minTextAdapt: Sizes.minTextAdapt,
        splitScreenMode: Sizes.splitScreenMode,
        builder: (_, __) {
          return MaterialApp.router(
            locale: (currentlang == null) ? null : Locale(currentlang.name),
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            restorationScopeId: 'app',
            onGenerateTitle: (BuildContext context) => 'Task App',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                elevation: 0,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // background (button) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
              ),
            ),
          );
        });
  }
}
