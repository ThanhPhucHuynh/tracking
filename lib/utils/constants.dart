import 'package:flutter/widgets.dart';

class ColorState {
  late Color startColor;
  late Color endColor;
  ColorState({
    required this.startColor,
    required this.endColor,
  });
}

class Constants {
  static const String TOKEN = 'token';

  static const String normalStateString = "normalStateString";
  static const String warningStateString = "warningStateColor";
  static ColorState normalStateColor =
      ColorState(startColor: Color(0xff6DC8F3), endColor: Color(0xff73A1F9));
  static ColorState warningStateColor =
      ColorState(startColor: Color(0xffFF5B95), endColor: Color(0xffF8556D));
}
