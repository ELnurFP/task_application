import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/language_drop_down.dart';
import 'package:task_list_app/service/local/shared_preferens.dart';

import 'lang_service.dart';

final languageProvider =
    StateNotifierProvider<LanguageProvider, LanguagesState>((ref) {
  return LanguageProvider();
});

class LanguageProvider extends StateNotifier<LanguagesState> {
  LanguageProvider() : super(LanguageInitial());

  AppLanguages? appLanguages;
  void init() {
    appLanguages = SharedPrefHelper.getLanguage();
    state = LanguageChanged();
  }

  Future<void> chnageLang(AppLanguages lang) async {
    state = languageLoading();
    try {
      await SharedPrefHelper.setLanguage(lang.name);
      appLanguages = lang;
      state = LanguageChanged();
    } catch (e) {
      state = LanguageError(e.toString());
    }
  }
}
