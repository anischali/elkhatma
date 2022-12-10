

import 'package:elkhatma/model/settings.dart';
import 'package:elkhatma/view/common.dart';
import 'package:flutter/material.dart';

class KhatmaMenu extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.settings),
            iconColor: Common.bordeau,
            textColor: Common.bordeau,
            title: Text(Settings.langString("SettingsBtn"))
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