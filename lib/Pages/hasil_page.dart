import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/function/topsis_function.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/widget_hasil_page.dart';

class HasilPage extends StatefulWidget {
  @override
  _HasilPageState createState() => _HasilPageState();
}

class _HasilPageState extends State<HasilPage> {
  @override
  void initState() {
    kuadrat();
    // raking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb1453b),
        title: Text('HASIL PERHITUNGAN'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 0),
        child:
            // Text(preferensiList.toString()),
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              widgetKriteriaHasilPage(context),
              widgetDataAnalisaHasilPage(),
              widgetNormalisasiHasilPage(),
              widgetNormalisasiTerbobotHasilPage(),
              widgetSolusiIdealHasilPage(),
              widgetTotalHasilPage(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
