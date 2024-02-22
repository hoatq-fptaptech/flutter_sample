part of app_layer;

class TextStyleManager {
  static TextStyle get label1 {
    return TextStyle(
      fontSize: 40.sp,
    );
  }

  static TextStyle get label2 {
    return TextStyle(
      fontSize: 36.sp,
    );
  }

  static TextStyle get label3 {
    return TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get label4 {
    return TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w200,
    );
  }

  static TextStyle get label5 {
    return TextStyle(
      fontSize: 18.sp,
    );
  }

  static TextStyle get label6 {
    return TextStyle(
      fontSize: 16.sp,
    );
  }

  static TextStyle get buttonLabel {
    return TextStyle(
      fontSize: 20.sp,
      color: ColorsManager.blue,
    );
  }
}
