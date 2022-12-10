import 'package:flutter/material.dart';

class Common {

static const Color bordeau = const Color.fromRGBO(224, 0, 48, .8);
static MaterialColor khatmaColor = MaterialColor(
  bordeau.value, 
  const <int, Color>{
    50:Color.fromRGBO(224, 0, 48, .1),
    100:Color.fromRGBO(224, 0, 48, .2),
    200:Color.fromRGBO(224, 0, 48, .3),
    300:Color.fromRGBO(224, 0, 48, .4),
    400:Color.fromRGBO(224, 0, 48, .5),
    500:Color.fromRGBO(224, 0, 48, .6),
    600:Color.fromRGBO(224, 0, 48, .7),
    700:bordeau,
    800:Color.fromRGBO(224, 0, 48, .9),
    900:Color.fromRGBO(224, 0, 48, 1)
  });  
}