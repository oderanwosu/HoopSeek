import 'package:flutter/material.dart';

class SizeHelper {
  BuildContext context;

  SizeHelper(this.context);

  double sx(double size) {
    return _ds().width * size;
  }

  double sy(double size) {
    return _ds().height * size;
  }

  Size _ds() {
    return MediaQuery.of(context).size;
  }
}
