import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const String appFont = 'Poppins';

  static Size getSize(BuildContext context) => MediaQuery.of(context).size;
}
