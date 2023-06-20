import 'package:flutter/material.dart';


//içerisine variable tanımlama diye kapattık
@immutable
class StringConstants {
  //dışarıdan bu class çağırıldığında new ile çağırılmaması için
  //değişken oluturmaması için
  const StringConstants._();
  static const String appName = 'Flutter Demo';
}
