import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/alternatif_page.dart';
import 'package:topsis_tanaman_hias/Pages/kriteria_page.dart';
import 'package:topsis_tanaman_hias/Pages/hasil_page.dart';

class TopsisPage extends StatefulWidget {
  @override
  _TopsisPageState createState() => _TopsisPageState();
}

class _TopsisPageState extends State<TopsisPage> {
  String preferensiText = '';

  @override
  void initState() {
    super.initState();
  }

  int page = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          (page == 2)
              ? AlternatifPage()
              : (page == 1)
                  ? KriteriaPage()
                  : HasilPage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [
                        Color(0xffb1453b),
                        Color(0xffD50000),
                        Color(0xffFF5722)
                      ], stops: [
                        0.0,
                        0.5,
                        0.8
                      ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        menuIconButton(Icons.tag, 1),
                        menuIconButton(Icons.home, 2),
                        menuIconButton(Icons.assignment, 3)
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuIconButton(icon, p) => IconButton(
        onPressed: () {
          setState(() {
            page = p;
          });
        },
        icon: (page == p)
            ? Container(
                // margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.white)),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              )
            : Icon(
                icon,
                color: Colors.white,
              ),
      );
}
