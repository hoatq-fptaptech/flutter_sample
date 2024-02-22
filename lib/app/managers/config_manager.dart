part of app_layer;

enum FlavorManager {
  dev,
  staging,
  production,
}

class ConfigManager {
  final String apiBaseUrl;
  final FlavorManager appFlavor;

  ConfigManager._({
    required this.apiBaseUrl,
    required this.appFlavor,
  });

  static ConfigManager? _instance;

  static ConfigManager devConfig = ConfigManager._(
    apiBaseUrl: 'https://your_dev_api',
    appFlavor: FlavorManager.dev,
  );

  static ConfigManager stagingConfig = ConfigManager._(
    apiBaseUrl: 'https://your_staging_api',
    appFlavor: FlavorManager.staging,
  );

  static ConfigManager productionConfig = ConfigManager._(
    apiBaseUrl: 'https://your_production_api',
    appFlavor: FlavorManager.production,
  );

  static ConfigManager getInstance({String? flavorName}) {
    if (_instance == null) {
      switch (flavorName) {
        case 'dev':
          _instance = devConfig;
          break;
        case 'staging':
          _instance = stagingConfig;
          break;
        case 'production':
          _instance = productionConfig;
          break;
        default:
          _instance = devConfig;
          break;
      }

      return _instance!;
    } else {
      return _instance!;
    }
  }
}
