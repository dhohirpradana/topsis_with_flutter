import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/topsis_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPK PEMILIHAN TANAMAN HIAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopsisPage(),
    );
  }
}
