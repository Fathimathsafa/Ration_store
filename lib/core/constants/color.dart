import 'package:flutter/material.dart';


class ColorTheme {
  static Color maincolor = Color(0xFF709CA5);
  static Color primarycolor = Color(0xFFFFFFFFF);
  static Color secondaryycolor = Color(0xFFE3E3E3);


}
double constantsize(BuildContext context) {
  return MediaQuery.of(context).size.width *(1 / 411);

}
