import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';




class Settings {
  static String settingsFile = "assets/model/settings.json";
  static String langFile = "assets/model/strings.json";
  static Map<String, dynamic> settings = <String, dynamic>{};
  static Map<String, dynamic> langStrings = <String, dynamic>{};
  static LocalStorage settingsStorage = LocalStorage("settings.json");
  
  
  static void loadSettingsAndLangs() async
  {
    String str = "";
    Directory appDataDir = await getApplicationDocumentsDirectory();
    final elkhatmaDir = Directory("${appDataDir.path}/.elkhatma");
    if (!elkhatmaDir.existsSync())
    {
      elkhatmaDir.createSync(recursive: true);
      str = await rootBundle.loadString(settingsFile);
      settings = jsonDecode(str);
      settingsStorage = LocalStorage("settings.json", elkhatmaDir.path, settings);
    }
    else
    {
      settingsStorage = LocalStorage("settings.json", elkhatmaDir.path);
    }

    str = await rootBundle.loadString(langFile);
    langStrings = jsonDecode(str);
  }

  static String langString(String key)
  {
    if (langStrings.containsKey(key))
    {
      return langStrings[key]?[settingsStorage.getItem("language")] as String;
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