import '../presentation/cubit/settings_cubit.dart';

extension MyStringExtension on String{
//   String tr(BuildContext context){
// return AppLocalizations.of(context)!.translate(this);
//   }
  String removeZerosAfterDot() {
    String num = this;
  if (num.contains('.')) {
    // Убираем все лишние нули после точки
    num = num.replaceAll(RegExp(r'0+$'), '');

    // Если после этого в конце осталась точка, удаляем её
    if (num.endsWith('.')) {
      num = num.substring(0, num.length - 1);
    }
  }
      return num;
}

  FontSizeType toEnum(){
    return FontSizeType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => FontSizeType.S, // Значение по умолчанию
    );
  }
}
extension MyFontSizeTypeExtension on FontSizeType{
  double toDouble(double fontSize){
    switch(this){
      case FontSizeType.xL:
      return fontSize * 1.7;
      case FontSizeType.L:
      return fontSize * 1.2;
      case FontSizeType.S:
      return fontSize * 0.8;
      case FontSizeType.xS:
      return fontSize * 0.5;
      }
  }
}