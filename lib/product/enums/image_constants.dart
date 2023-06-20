//içerisine variable tanımlama diye kapattık

/* @immutable
class ImageConstants {
  //dışarıdan bu class çağırıldığında new ile çağırılmaması için
  //değişken oluturmaması için
   ImageConstants._();
  final  String microphhone = 'ic_microphone'.iconToPng;
}

extension _StringPath on String {
  String get iconToPng => 'assets/icon/$this.png';
}
 */

enum ImageConstants {
  microphone('ic_microphone');

  final String value;

  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
}
