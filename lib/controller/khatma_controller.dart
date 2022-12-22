import 'dart:convert';
import 'dart:io';

import 'package:elkhatma/model/common.dart';
import 'package:elkhatma/model/khatma.dart';


class KhatmaController {
  late Khatmat khatmats;

  KhatmaController()
  {
    khatmats = Khatmat();
  }


  void addKhatma(int days, int mode)
  {
    DateTime date = DateTime.now().toLocal();
    Khatma k = Khatma(date, days, mode);
    khatmats.addKhatmat(k);
  }

  void putKhatma(Khatma k)
  {
    khatmats.addKhatmat(k);
  }

  List<Khatma> getKhatmats()
  {
    return khatmats.getKhatmats();
  }
}
