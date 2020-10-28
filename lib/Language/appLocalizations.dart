import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class AppLocale{
  Locale locale;
  AppLocale(this.locale);

  Map<String, String>  _loadedLocalizedValues;
  static AppLocale of (BuildContext context){
    return Localizations.of(context, AppLocale);

  }


  Future loadLanguage()async{
    String _languageFile=await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    Map<String,dynamic>_loadValues=jsonDecode(_languageFile);
    _loadedLocalizedValues =_loadValues.map((key, value) => MapEntry(key, value.toString()));
  }
  String getTranslated(String key){
    return _loadedLocalizedValues[key];

  }
  static const LocalizationsDelegate<AppLocale> delegate=_AppLocaleDelegate();
}
class _AppLocaleDelegate extends LocalizationsDelegate<AppLocale>{
  const _AppLocaleDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en","ar"].contains(locale.languageCode);
  }
  @override
  Future<AppLocale> load(Locale locale)async {
    AppLocale appLocale=AppLocale(locale);
    await appLocale.loadLanguage();
    return appLocale;

  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocale> old) =>false;


}