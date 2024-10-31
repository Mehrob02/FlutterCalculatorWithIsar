import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//default key-values
const String isDarkModeKey = "isDarkTheme";
const String fontSizeKey = "fontSize";
const String fontSizeTypeKey = "fontType";
const bool isDarkModeValue = false;
const double fontSizeValue = 16.0;
const FontSizeType fontSizeTypeValue = FontSizeType.S;

enum FontSizeType{xL,L,S,xS}
class SettingsCubit extends Cubit<Map<String, dynamic>> {
  SettingsCubit() : super({
    isDarkModeKey: isDarkModeValue,
    // fontSizeTypeKey:fontSizeTypeValue,
    // fontSizeKey: fontSizeValue,
  }) {
    _init();
  //  FlutterNativeSplash.remove();
  }

  Future<void> _init() async {
    final pref = await SharedPreferences.getInstance();
    bool isDarkTheme = pref.getBool(isDarkModeKey) ?? isDarkModeValue;
    // String _fontSizeType = pref.getString(fontSizeTypeKey)??fontSizeTypeValue.name;
    // double fontSize = pref.getDouble(fontSizeKey)??fontSizeValue;
    // FontSizeType fontSizeType = _fontSizeType.toEnum();
    emit({
      ...state, 
      isDarkModeKey: isDarkTheme,
      // fontSizeTypeKey: fontSizeType,
      // fontSizeKey: fontSize,
    });
  }
  Future<void> saveFontSize(double fontSize) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setDouble(fontSizeKey, fontSize);
  }
  Future<void> saveFontSizeType(FontSizeType fontSizeType) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(fontSizeTypeKey, fontSizeType.name);
  }
  Future<void> saveTheme(bool isDarkMode) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(isDarkModeKey, isDarkMode);
  }
  void changeFontSize(double newFontSize){
    emit({
      ...state,
      fontSizeKey: newFontSize,
      });
      saveFontSize(newFontSize);
  }
  void changeFontSizeType(FontSizeType newFontSizeType){
     emit({
      ...state,
      fontSizeTypeKey: newFontSizeType,
      });
      saveFontSizeType(newFontSizeType);
  }
  void changeTheme() {
    bool isDarkTheme = state[isDarkModeKey] ?? false;
    if (isDarkTheme) {
      emit({
        ...state,
        isDarkModeKey: false,
      });
      saveTheme(false);
    } else {
      emit({
        ...state,
        isDarkModeKey: true,
      });
      saveTheme(true);
    }
  }
}
