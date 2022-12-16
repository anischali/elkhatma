import 'package:elkhatma/controller/khatma_controller.dart';
import 'package:elkhatma/model/common.dart';
import 'package:elkhatma/model/khatma.dart';
import 'package:elkhatma/view/side_panel.dart';
import 'package:elkhatma/view/common.dart' as vcom;
import 'package:flutter/material.dart';
import 'package:elkhatma/model/settings.dart';


class KhatmaMainPage extends StatefulWidget {
  late KhatmaController khatmaController;
  KhatmaMainPage({super.key, required this.title})
  {
    initialize();
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  
  void initialize() async
  {
    await Common.setup().then((value) async { 
      await Settings.loadSettingsAndLangs().then((value1){
        khatmaController = KhatmaController();
      });
    });
  }

  void addNewKhatmaCallback(Khatma k)
  {
    khatmaController.putKhatma(k);
  }

  List<Khatma> getKhatmats()
  {
    return khatmaController.getKhatmats();
  }

  @override
  // ignore: no_logic_in_create_state
  State<KhatmaMainPage> createState() => _KhatmaMainPageState(addNewKhatmaCallback, getKhatmats);
}

class _KhatmaMainPageState extends State<KhatmaMainPage> {

  final Function onAddNewKhatmaCallback;
  final Function getAllKhatmatsCallback;
  List<Widget> khatmatsView = <Widget>[];

  _KhatmaMainPageState(this.onAddNewKhatmaCallback, this.getAllKhatmatsCallback);

  void addNewKhatma() {
    setState(() {
        Khatma k = Khatma(DateTime.now().toLocal(), 1, 1);
        onAddNewKhatmaCallback(k);
    });
    refresh();
  }

  void refresh()
  {
    setState(() {
      khatmatsView = <Widget>[];
      List<Khatma> ks = getAllKhatmatsCallback();
      for (Khatma k in ks)
      {
        khatmatsView.add(
          ExpansionTile(
            leading: const Icon(Icons.menu_book),
            title: Text(k.toString()),
            textColor: vcom.Common.bordeau,
            iconColor: vcom.Common.bordeau,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.check))
            ],
          )
          /*ListTile (
            leading: const Icon(Icons.menu_book),
            title: Text(k.toString()),
            textColor: vcom.Common.bordeau,
            iconColor: vcom.Common.bordeau
          )*/
        );
      }
    });
  }

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
        title: Text(Settings.langString("mainPageTitle")),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      drawer: const KhatmaMenu(),
      onDrawerChanged: (isOpened) => refresh(),
      body: ListView(
        children: khatmatsView,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewKhatma,
        tooltip: Settings.langString("AddKhatmaTooltip"),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}