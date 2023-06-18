import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_list_app/service/lang_service/lang_notifier.dart';
import 'package:task_list_app/service/lang_service/lang_service.dart';

import '../constanst/app_style.dart';

class LanguageDropdown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = ref.watch(languageProvider);
    final currentLang = ref.watch(languageProvider.notifier).appLanguages;
    if (languageState is languageLoading) {
      return CircularProgressIndicator();
    }

    return DropdownButton<AppLanguages>(
        underline: SizedBox(),
        style: TextStyle(
            color: AppStyle.activeNavColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp),
        value: currentLang == null ? AppLanguages.en : currentLang,
        items: List.generate(
          AppLanguages.values.length,
          (index) => DropdownMenuItem(
            value: AppLanguages.values[index],
            child: Text(
              AppLanguages.values[index].getLangName,
            ),
          ),
        ),
        onChanged: (value) {
          if (value == currentLang) {
            return;
          }
          ref.read(languageProvider.notifier).chnageLang(value!);
        });
  }
}

enum AppLanguages { en, ar }

extension LanguageHandler on AppLanguages {
  String get getLangName {
    switch (this) {
      case AppLanguages.en:
        return 'English';

      case AppLanguages.ar:
        return 'Arabic';
    }
  }
}
