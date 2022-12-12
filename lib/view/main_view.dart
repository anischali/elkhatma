import 'package:elkhatma/controller/khatma_controller.dart';
import 'package:elkhatma/model/common.dart';
import 'package:elkhatma/model/khatma.dart';
import 'package:elkhatma/view/side_panel.dart';
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
    await Common.setup();
    await Settings.loadSettingsAndLangs();

    khatmaController = KhatmaController();
  }

  void AddNewKhatmaCallback(Khatma k)
  {
    khatmaController.putKhatma(k);
  }

  @override
  State<KhatmaMainPage> createState() => _KhatmaMainPageState(AddNewKhatmaCallback);
}

class _KhatmaMainPageState extends State<KhatmaMainPage> {

  final Function onAddNewKhatmaCallback;

  _KhatmaMainPageState(this.onAddNewKhatmaCallback);

  void addNewKhatma() {
    setState(() {
        Khatma k = Khatma(DateTime.now().toLocal(), 1, 1);
        onAddNewKhatmaCallback(k);
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
      onDrawerChanged: (isOpened) => setState(() {}),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewKhatma,
        tooltip: Settings.langString("AddKhatmaTooltip"),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}