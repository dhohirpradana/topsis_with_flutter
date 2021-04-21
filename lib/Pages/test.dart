import 'dart:math';

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List topsis = [
    {
      'a1': {
        'c1': 5,
        'c2': 2,
        'c3': 1,
        'c4': 4,
        'c5': 1,
      },
      'a2': {
        'c1': 5,
        'c2': 1,
        'c3': 1,
        'c4': 3,
        'c5': 1,
      },
      'a3': {
        'c1': 5,
        'c2': 3,
        'c3': 1,
        'c4': 4,
        'c5': 1,
      },
    }
  ];

  List bobot = [
    {
      'c1': 5,
      'c2': 3,
      'c3': 4,
      'c4': 2,
      'c5': 5,
    }
  ];

  List kuadratList = [];
  List sumKuadratList = [];
  List normalisasiList = [];
  List normalisasiTerbobotList = [];
  List solusiIdealList = [];
  List maxList = [];
  List minList = [];
  List totalPositifList = [];
  List totalPositifListIndex = [];
  List totalNegatifList = [];
  List totalNegatifListIndex = [];
  List sqrtSumTotalPositifList = [];
  List sqrtSumTotalNegatifList = [];
  List preferensiList = [];

  kuadrat() {
    kuadratList.clear();
    for (var i = 0; i < topsis[0].length; i++) {
      final a = i + 1;
      for (var i = 0; i < topsis[0]['a$a'].length; i++) {
        final c = i + 1;
        final kuadrat = topsis[0]['a$a']['c$c'] * topsis[0]['a$a']['c$c'];
        kuadratList.add(kuadrat);
      }
    }
    sumKuadrat();
  }

  sumKuadrat() {
    sumKuadratList.clear();
    final increment = kuadratList.length / topsis[0]['a1'].length;
    final cLength = kuadratList.length / increment;
    for (var i = 0; i < kuadratList.length / increment; i++) {
      final sumKuadrat = kuadratList[i] +
          kuadratList[i + cLength.toInt()] +
          kuadratList[i + 2 * cLength.toInt()];
      sumKuadratList.add(sumKuadrat);
    }
    normalisasi();
  }

  normalisasi() {
    normalisasiList.clear();
    for (var i = 0; i < topsis[0].length; i++) {
      final a = i + 1;
      for (var i = 0; i < topsis[0]['a$a'].length; i++) {
        final c = i + 1;
        final normalisasi = topsis[0]['a$a']['c$c'] / sqrt(sumKuadratList[i]);
        normalisasiList.add(normalisasi);
      }
    }
    normalisasiTerbobot();
  }

  normalisasiTerbobot() {
    normalisasiTerbobotList.clear();
    for (var index = 0;
        index < normalisasiList.length;
        index = index + bobot[0].length) {
      for (var i = 0; i < bobot[0].length; i++) {
        final inx = i + 1;
        final normalisasiTerbobot =
            normalisasiList[index + i] * bobot[0]['c$inx'];
        normalisasiTerbobotList.add(normalisasiTerbobot);
      }
    }
    solusiIdeal();
  }

  solusiIdeal() {
    solusiIdealList.clear();
    for (var index = 0; index < bobot[0].length; index++) {
      var i = 0;
      var maxI = normalisasiTerbobotList.length;
      do {
        final iIndex = i + index;
        final positif = normalisasiTerbobotList[iIndex];
        solusiIdealList.add(positif);
        i = i + 5;
      } while (i < maxI);
    }
    maxMinSolusiIdeal();
  }

  maxMinSolusiIdeal() {
    maxList.clear();
    minList.clear();
    final length = normalisasiTerbobotList.length / bobot[0].length;
    for (var index = 0;
        index < normalisasiTerbobotList.length;
        index = index + length.toInt()) {
      final max = [
        solusiIdealList[index],
        solusiIdealList[index + 1],
        solusiIdealList[index + 2]
      ].reduce((curr, next) => curr > next ? curr : next);
      final min = [
        solusiIdealList[index],
        solusiIdealList[index + 1],
        solusiIdealList[index + 2]
      ].reduce((curr, next) => curr < next ? curr : next);
      maxList.add(max);
      minList.add(min);
    }
    total();
  }

  total() {
    //+
    totalPositifList.clear();
    sqrtSumTotalPositifList.clear();
    //-
    totalNegatifList.clear();
    sqrtSumTotalNegatifList.clear();
    for (var i = 0;
        i < normalisasiTerbobotList.length;
        i = i + bobot[0].length.toInt()) {
      for (var index = 0; index < 5; index++) {
        //+
        final totalPositif =
            normalisasiTerbobotList[i + index] - maxList[index];
        final kuadratPositif = totalPositif * totalPositif;
        totalPositifList.add(kuadratPositif);

        //-
        final totalNegatif =
            normalisasiTerbobotList[i + index] - minList[index];
        final kuadratNegatif = totalNegatif * totalNegatif;
        totalNegatifList.add(kuadratNegatif);
      }
    }

    for (var i = 0;
        i < normalisasiTerbobotList.length;
        i = i + bobot[0].length.toInt()) {
      totalPositifListIndex.clear();
      totalNegatifListIndex.clear();
      for (var index = 0; index < bobot[0].length.toInt(); index++) {
        //+
        final totalIndexPositif = totalPositifList[index + i];
        totalPositifListIndex.add(totalIndexPositif);
        //-
        final totalIndexNegatif = totalNegatifList[index + i];
        totalNegatifListIndex.add(totalIndexNegatif);
      }
      //+
      final sumPositif = sqrt(totalPositifListIndex.fold(
          0, (previous, current) => previous + current));
      sqrtSumTotalPositifList.add(sumPositif);
      // print(sqrtSumTotalPositifList);
      //-
      final sumNegatif = sqrt(totalNegatifListIndex.fold(
          0, (previous, current) => previous + current));
      sqrtSumTotalNegatifList.add(sumNegatif);
      // print(sqrtSumTotalNegatifList);
    }
    preferensi();
  }

  preferensi() {
    preferensiList.clear();
    for (var index = 0; index < topsis[0].length; index++) {
      final preferensi = sqrtSumTotalNegatifList[index] /
          (sqrtSumTotalNegatifList[index] + sqrtSumTotalPositifList[index]);
      // print(preferensi);
      preferensiList.add(preferensi);
    }
    setState(() {
      preferensiText = preferensiList.toString();
    });
  }

  String preferensiText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOPSIS'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text('Data Alternatif Tanaman Hias : '),
              Column(
                children: [
                  for (var i = 1; i <= topsis[0].length; i++)
                    Text('Alternatif $i : ' + topsis[0]['a$i'].toString()),
                ],
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  kuadrat();
                },
                child: Text('HITUNG'),
              ),
              Text('Result : '),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < preferensiList.length; i++)
                    Text('Alternatif ' +
                        (i + 1).toString() +
                        ' : ' +
                        preferensiList[i].toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
