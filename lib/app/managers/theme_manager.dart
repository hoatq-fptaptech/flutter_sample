part of app_layer;

class ThemeManager with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: const ColorScheme.light(background: ColorsManager.white),
      scaffoldBackgroundColor: ColorsManager.white,
      brightness: Brightness.light,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: const ColorScheme.dark(background: ColorsManager.black),
      scaffoldBackgroundColor: ColorsManager.black,
      brightness: Brightness.dark,
    );
  }
}
