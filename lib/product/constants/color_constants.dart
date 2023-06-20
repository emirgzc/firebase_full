//içerisine variable tanımlama diye kapattık
import 'package:flutter/material.dart';

@immutable
class ColorConstants {
  //dışarıdan bu class çağırıldığında new ile çağırılmaması için
  //değişken oluturmaması için
  const ColorConstants._();
  static const Color purpleDart = Color(0xff2536a7);
  static const Color purplePrimary = Color(0xff475AD7);

}
