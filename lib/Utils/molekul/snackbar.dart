import 'package:flutter/material.dart';

void showFlushBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(milliseconds: 1500),
      elevation: 2,
      content: Text('Tidak boleh kurang dari 2 data Alternatif'),
    ),
  );
}
