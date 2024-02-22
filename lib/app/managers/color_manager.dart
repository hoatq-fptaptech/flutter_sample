part of app_layer;

class ColorsManager {
  static const white = Colors.white;
  static const black = Colors.black;
  static const blue = Colors.blue;
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}
