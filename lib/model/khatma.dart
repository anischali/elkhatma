import 'dart:convert';

import 'package:elkhatma/model/common.dart';
import 'package:intl/intl.dart';
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
  DateTime beginDate = DateTime.now().toLocal();
  int days = 1;
  int mode = 1;
  int progress = 0;
  List<KhatmaPart> khatmaParts = <KhatmaPart>[];
  

  Khatma(
    this.beginDate,
    this.days,
    this.mode
  );

  Khatma.fromJson(Map<String, dynamic> json) {
      

      beginDate = DateTime.parse(json["beginDate"]).toLocal();
      days = json["days"];
      mode = json["mode"];
      progress = json["progress"];      
      List<dynamic> lp = json["khatmaParts"] ?? <dynamic>[];
      for (var element in lp) {
        khatmaParts.add(KhatmaPart.fromJson(element));
      }

  }

  Map<String, dynamic> toJson() => {
    "beginDate":beginDate.toLocal().toString(),
    "days":days,
    "mode":mode,
    "progress":progress,
    "khatmaParts": khatmaParts
  };

  @override
  String toString() {
    final f = DateFormat('yyyy-MM-dd hh:mm');
    return "${f.format(beginDate)}\t$days\t$progress";
  }

}


class Khatmat
{
  late LocalStorage khatmatStorage;
  Map<String, Khatma> khatmats = <String, Khatma>{};

  Khatmat()
  {
    khatmatStorage = Common.localStorages["khatmats"]!;
    var kh = khatmatStorage.getItem("khatmats") ?? <String, Khatma>{};
    for (MapEntry<String, dynamic> k in kh.entries)
    {
      khatmats[k.key] = Khatma.fromJson(k.value);
    }
  }


  void addKhatmat(Khatma k)
  {
    khatmats[k.beginDate.hashCode.toString()] = k;
    khatmatStorage.setItem("khatmats", khatmats);
  }


  List<Khatma> getKhatmats()
  {
    return khatmats.values.toList(growable: false);
  }
}