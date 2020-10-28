
import 'package:flutter/material.dart';
import 'package:my_cab_driver/Language/appLocalizations.dart';
String getTranslated(BuildContext context, String key){
  return AppLocale.of(context).getTranslated(key);
}