import 'package:elkhatma/model/settings.dart';
import 'package:elkhatma/view/common.dart';
import 'package:elkhatma/view/settings_panel.dart';
import 'package:flutter/material.dart';
import 'admin_panel.dart';

class KhatmaMenu extends StatelessWidget
{
  static int tapCount = 0;

  const KhatmaMenu({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GestureDetector (
            onTap: () {
              if (Settings.getSetting("adminPanel") == 1)
              {
                return;
              }
              if (tapCount > 7)
              {
                Settings.setSetting("adminPanel", 1);
                // ignore: invalid_use_of_protected_member
                (context as Element).reassemble();
                tapCount = 0;
              }
              ++tapCount;
            },
            child: const DrawerHeader(
                child: null,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/img/khatma_ico_256.png"),
                  )
                ),
              ),
          ),
          Visibility(
            visible: Settings.getSetting("adminPanel") == 1,
            child: ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              iconColor: Common.bordeau,
              textColor: Common.bordeau,
              title: Text(Settings.langString("adminPanelBtn")),
              onTap: () => {
                Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: 
                  (context) => 
                    KhatmaAdminPage(title: Settings.langString("adminPanelBtn")
                  )
                )
              ).then((value) => (context as Element).reassemble())
            },
            )
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            iconColor: Common.bordeau,
            textColor: Common.bordeau,
            title: Text(Settings.langString("SettingsBtn")),
            onTap: () => {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: 
                  (context) => 
                    KhatmaSettingsPage(title: Settings.langString("settingPageTitle")
                  )
                )
              ).then((value) => (context as Element).reassemble())
            },
          ),
          ListTile(
            leading: const Icon(Icons.three_p),
            iconColor: Common.bordeau,
            textColor: Common.bordeau,
            title: Text(Settings.langString("AboutBtn"))
          )
        ]
      )
    );
  }
}