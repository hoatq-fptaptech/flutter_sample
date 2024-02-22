part of app_layer;

class SessionUtils {
  static bool get isDarkTheme =>
      getIt<ThemeManager>().currentTheme == ThemeMode.dark;

  static void saveAccessToken(String accessToken) =>
      getIt<SharedPreferencesManager>().putString(
        SharedPreferenceKey.keyAccessToken,
        accessToken,
      );
}
