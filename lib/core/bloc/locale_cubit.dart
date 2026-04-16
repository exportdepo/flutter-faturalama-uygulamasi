import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const String _localeKey = 'app_locale';
  static Box get _settingsBox => Hive.box('settings');

  LocaleCubit() : super(const LocaleState(locale: Locale('tr'))) {
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    final savedLocale =
        _settingsBox.get(_localeKey, defaultValue: 'tr') as String;
    emit(LocaleState(locale: Locale(savedLocale)));
  }

  void changeLocale(String languageCode) {
    _settingsBox.put(_localeKey, languageCode);
    emit(LocaleState(locale: Locale(languageCode)));
  }
}
