

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';




class Settings {
  static String settingsFile = "assets/model/settings.json";
  static String langFile = "assets/model/strings.json";
  static Map<String, dynamic> settings = <String, dynamic>{};
  static Map<String, dynamic> langStrings = <String, dynamic>{};
  
    static void loadSettingsAndLangs() async
    {
        String str = await rootBundle.loadString(settingsFile);
        settings = jsonDecode(str);
        str = await rootBundle.loadString(langFile);
        langStrings = jsonDecode(str);
    }

    static void saveSetting()
    {
        String json = jsonEncode(settings);
        File db = File(settingsFile);
        db.writeAsStringSync(json);
    }


    static String langString(String key)
    {
      if (langStrings.containsKey(key))
      {
        return langStrings[key]?[settings["language"]] as String;
      }
      return ""; 
    }
}