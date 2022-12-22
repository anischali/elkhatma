import 'package:flutter/material.dart';
import 'package:elkhatma/model/settings.dart';

import 'common.dart';


class KhatmaLanguagePage extends StatefulWidget {
  KhatmaLanguagePage({super.key, required this.title});
 
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title;
  
  @override
  State<KhatmaLanguagePage> createState() => _KhatmaLanguagePageState();
}

class _KhatmaLanguagePageState extends State<KhatmaLanguagePage> {
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(Settings.langString("languageLabel")),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: (Settings.getSetting("language") == 'Ar') ? const Icon(Icons.check) : null,
              iconColor: Common.bordeau,
              textColor: Common.bordeau,
              title: Text(Settings.langString("languageLabelAr")),
              onTap: () {
                Settings.setSetting("language", "Ar");
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
              }
            ),
            ListTile(
              leading: (Settings.getSetting("language") == 'Fr') ? const Icon(Icons.check) : null,
              iconColor: Common.bordeau,
              textColor: Common.bordeau,
              title: Text(Settings.langString("languageLabelFr")),
              onTap: () {
                Settings.setSetting("language", "Fr");
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
              }
            ),
            ListTile(
              leading: (Settings.getSetting("language") == 'En') ? const Icon(Icons.check) : null,
              iconColor: Common.bordeau,
              textColor: Common.bordeau,
              title: Text(Settings.langString("languageLabelEn")),
              onTap: () {
                Settings.setSetting("language", "En");
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
              }
            ),
          ],
        ),
      )
    );
  }
}