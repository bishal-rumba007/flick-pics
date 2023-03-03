import 'package:flutter/painting.dart';

// creating a new class and from here we create Color objects which gives colors and can be accessed anywhere inside the code
class ColorManager {
  static Color primary = HexColor.fromHex("#242A32");
  static Color secondary = HexColor.fromHex("#FFFFFF");
  static Color backGround = HexColor.fromHex("#242A32");
  static Color inputColor = HexColor.fromHex("#67686D");
  static Color inputColor2 = HexColor.fromHex("#3A3F47");
  static Color iconGray = HexColor.fromHex("#67686D");
  static Color textGray = HexColor.fromHex("#242A32");
  static Color blue = HexColor.fromHex("#0296E5");
}

/// this is a function which takes the string value of hex and formats it into hexadecimal value
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', ''); // replacing # with ' '
    if (hexColorString.length == 6) {
      /// if the length is equal to 6
      hexColorString =
          "FF" + hexColorString; /// then add FF in front to make it 8
    }
    return Color(int.parse(hexColorString, radix: 16)); /// return the Color object with the parsed hexValue with base 16 which is of Hexadecimal
  }
}