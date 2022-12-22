import 'dart:convert';
import 'dart:io';
import 'package:elkhatma/model/khatma.dart';
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
  static String elkhatmaDirPath = "";

  static Future<void> setup() async
  {
    String str = "";
    Directory appDataDir = await getApplicationDocumentsDirectory();
    final elkhatmaDir = Directory("${appDataDir.path}/.elkhatma");
    elkhatmaDirPath = elkhatmaDir.path;
    if (!elkhatmaDir.existsSync())
    {
      elkhatmaDir.createSync(recursive: true);
      str = await rootBundle.loadString(settingsFile);
      var settings = jsonDecode(str);
      localStorages["settings"] = LocalStorage("settings.json", elkhatmaDir.path, settings);
      localStorages["khatmats"] = LocalStorage("khatmats.json", elkhatmaDir.path);
    }
    else
    {
      File f = File("${elkhatmaDir.path}/settings.json");
      Map<String,dynamic> initialSetting = f.existsSync() ?
      jsonDecode(f.readAsStringSync()) : 
      await rootBundle.loadString(settingsFile).then((value) 
      { 
        return jsonDecode(value);
      });
      localStorages["settings"] = LocalStorage("settings.json", elkhatmaDir.path, initialSetting);
      
      f = File("${elkhatmaDir.path}/khatmats.json");
      if (f.existsSync())
      {
        var t = jsonDecode(f.readAsStringSync());
      }
      var initialKhatmats = f.existsSync() ? jsonDecode(f.readAsStringSync()) : {}; 
      localStorages["khatmats"] = LocalStorage("khatmats.json", elkhatmaDir.path, initialKhatmats);
    }

    str = await rootBundle.loadString(langFile);
    langStrings = jsonDecode(str);
  }
}