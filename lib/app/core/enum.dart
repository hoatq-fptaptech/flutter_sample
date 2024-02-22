part of app_layer;

extension EnumExt on Enum {
  static Enum? enumFromString(String? key, Iterable<Enum> values) =>
      values.firstWhereOrNull((v) => key == v.name);
}
