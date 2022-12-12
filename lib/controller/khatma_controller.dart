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
    khatmats.khatmatStorage.setItem(date.toString(), k);
  }

  void putKhatma(Khatma k)
  {
    khatmats.khatmatStorage.setItem(k.beginDate.hashCode.toString(), k);
  }
}
