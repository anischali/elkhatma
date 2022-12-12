import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';

enum Orders
{
  revelation,
  prophet
}

enum RevelationPlace
{
  makkah,
  madina 
}


class Common
{
  static Map<String, dynamic> langStrings = <String, dynamic>{};
  static String settingsFile = "assets/model/settings.json";
  static String langFile = "assets/model/strings.json";
  static Map<String, LocalStorage> localStorages = <String, LocalStorage>{}; 

  static Future<void> setup() async
  {
    String str = "";
    Directory appDataDir = await getApplicationDocumentsDirectory();
    final elkhatmaDir = Directory("${appDataDir.path}/.elkhatma");
    if (!elkhatmaDir.existsSync())
    {
      elkhatmaDir.createSync(recursive: true);
      str = await rootBundle.loadString(settingsFile);
      var settings = jsonDecode(str);
      LocalStorage("settings.json", elkhatmaDir.path, settings);
    }

    str = await rootBundle.loadString(langFile);
    langStrings = jsonDecode(str);

    localStorages["settings"] = LocalStorage("settings.json", elkhatmaDir.path);
    localStorages["khatmat"] = LocalStorage("khatmat.json", elkhatmaDir.path);
  }
}