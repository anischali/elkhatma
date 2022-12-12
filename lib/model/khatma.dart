import 'dart:convert';
import 'package:elkhatma/model/common.dart';
import 'package:localstorage/localstorage.dart';

class KhatmaPart
{
  final int sourateBeginIndex;
  final int sourateEndIndex;
  final int beginIndex;
  final int endIndex;
  bool finished = false;

  KhatmaPart(
    this.sourateBeginIndex,
    this.sourateEndIndex,
    this.beginIndex,
    this.endIndex,
  );

  KhatmaPart.fromJson(Map<String, dynamic> json)
    :   sourateBeginIndex = json["sourateBeginIndex"],
        sourateEndIndex = json["sourateEndIndex"],
        beginIndex = json["beginIndex"],
        endIndex = json["endIndex"],
        finished = json["finished"];

  Map<String, dynamic> toJson() => {
        "sourateBeginIndex":sourateBeginIndex,
        "sourateEndIndex":sourateEndIndex,
        "beginIndex":beginIndex,
        "endIndex":endIndex,
        "finished": finished
  };

}



class Khatma
{
  DateTime beginDate;
  int days;
  int mode;
  int progress = 0;
  List<KhatmaPart> khatmaParts = <KhatmaPart>[];
  

  Khatma(
    this.beginDate,
    this.days,
    this.mode
  );

  Khatma.fromJson(Map<String, dynamic> json)
    : beginDate = DateTime.parse(json["beginDate"]).toLocal(),
      days = json["days"],
      mode = json["mode"],
      progress = json["progress"],
      khatmaParts = json["khatmaParts"];
  
  Map<String, dynamic> toJson() => {
    "beginDate":beginDate.toLocal().toString(),
    "days":days,
    "mode":mode,
    "progress":progress,
    "khatmaParts": jsonEncode(khatmaParts)
  };

}


class Khatmat
{
  late LocalStorage khatmatStorage;

  Khatmat()
  {
    khatmatStorage = Common.localStorages["khatmat"]!;
  }
}