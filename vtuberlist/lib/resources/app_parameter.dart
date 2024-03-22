
import 'package:flutter/cupertino.dart';

class APPParameter {

  static const String apiDomain = "http://192.168.0.14:8000";

  static double getScreenWdith(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}