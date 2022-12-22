

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class Sourate {
    final int order;
    final int revelationOrder;
    final Map<String,dynamic> names;
    final int versesNum;
    final int pagesNum;
    final int hizbNum;
    final int partNum;
    final int revelationPlace;

    Sourate(
        this.order, 
        this.revelationOrder, 
        this.names, 
        this.versesNum,
        this.pagesNum,
        this.hizbNum,
        this.partNum,
        this.revelationPlace);


    Sourate.fromJson(Map<String, dynamic> json)
        :   order = json["order"],
            revelationOrder = json["revelationOrder"],
            names = json["names"],
            versesNum = json["verses"],
            pagesNum = json["pages"],
            hizbNum = json["hizb"],
            partNum = json["part"],
            revelationPlace = json["revelationPlace"];

    Map<String, dynamic> toJson() => {
        "order":order,
        "revelationOrder":revelationOrder,
        "names":jsonEncode(names),
        "versesNum":versesNum,
        "pagesNum":pagesNum,
        "hizbNum":hizbNum,
        "partNum":partNum,
        "revelationPlace":revelationPlace
    };
}

class Quraan {
    String database = "assets/model/quraan.json";
    List<Sourate> sourates = <Sourate>[];

    void loadDatabase() async
    {
        String db = await rootBundle.loadString(database);
        var json = jsonDecode(db);
        for (var j in json) {
            sourates.add(Sourate.fromJson(j));
        }
    }

    void toJson()
    {
        String json = jsonEncode(sourates);
        File db = File(database);
        db.writeAsStringSync(json);
    }
}
