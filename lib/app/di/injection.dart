part of app_layer;

GetIt getIt = GetIt.instance;

@injectableInit
Future<void> setupInjection() => getIt.init();

@module
abstract class RegisterModule {
  @Named('BaseUrl')
  String get baseUrl => ConfigManager.getInstance().apiBaseUrl;
  @Named('Timeout')
  Duration get timeout => const Duration(seconds: 10);

  @preResolve
  Future<SharedPreferencesManager> get prefs =>
      SharedPreferencesManager.getInstance();

  @lazySingleton
  ThemeManager get themeManager => ThemeManager();

  @lazySingleton
  Dio dio(
    @Named('BaseUrl') String url,
    @Named('Timeout') Duration timeout,
  ) {
    return Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: timeout,
        contentType: 'application/json',
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
  }

  @lazySingleton
  LoginApi loginApi(@Named('BaseUrl') String url) {
    return LoginApi(getIt<Dio>(), baseUrl: '$url/user');
  }
}
