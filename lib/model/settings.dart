import 'dart:convert';
import 'dart:io';
import 'package:elkhatma/model/common.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';




class Settings {
  static late LocalStorage settingsStorage;
  
  
  static Future<void> loadSettingsAndLangs() async
  {
    settingsStorage = Common.localStorages["settings"]!;
  }

  static String langString(String key)
  {
    if (Common.langStrings.containsKey(key))
    {
      return Common.langStrings[key]?[settingsStorage.getItem("language") ?? "Ar"] as String;
    }
    return ""; 
  }

  static void setSetting(String key, dynamic value)
  {
    settingsStorage.setItem(key, value);
  }

  static dynamic getSetting(String key)
  {
    return settingsStorage.getItem(key);
  }
}