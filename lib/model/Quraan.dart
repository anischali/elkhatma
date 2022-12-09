

import 'dart:convert';
import 'dart:io';

class Sourate {
    final int order;
    final int revelationOrder;
    final Map<String,dynamic> names;
    final int versesNum;
    final int pagesNum;
    final int hizbNum;
    final int partNum;

    Sourate(
        this.order, 
        this.revelationOrder, 
        this.names, 
        this.versesNum,
        this.pagesNum,
        this.hizbNum,
        this.partNum);


    Sourate.fromJson(Map<String, dynamic> json)
        :   order = json["order"],
            revelationOrder = json["revelationOrder"],
            names = json["names"],
            versesNum = json["verses"],
            pagesNum = json["pages"],
            hizbNum = json["hizb"],
            partNum = json["part"];

    Map<String, dynamic> toJson() => {
        "order":order,
        "revelationOrder":revelationOrder,
        "names":jsonEncode(names),
        "versesNum":versesNum,
        "pagesNum":pagesNum,
        "hizbNum":hizbNum,
        "partNum":partNum
    };
}

class Quraan {
    String database;
    List<Sourate> sourates = <Sourate>[];

    Quraan(this.database)
    {
        File db = File(database);
        var json = jsonDecode(db.readAsStringSync());
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
