import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(BuildContext context) {
  Flushbar(
    isDismissible: true,
    barBlur: 0.5,
    title: 'Information',
    message: 'Tidak boleh kurang dari 2 data Alternatif',
    icon: Icon(
      Icons.info_outline_rounded,
      size: 28,
      color: Colors.blue.shade300,
    ),
    leftBarIndicatorColor: Colors.blue.shade300,
    duration: Duration(milliseconds: 1700),
  )..show(context);
}
