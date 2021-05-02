import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';

setC(i, value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('c$i', value);
}

Future<int> getC(i) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt("c$i") ?? 1;
}

void addTopsis(topsis, i) {
  topsis.insert(i + 1, {'c1': 0, 'c2': 0, 'c3': 0, 'c4': 0, 'c5': 0});
}

kuadrat() {
  kuadratList.clear();
  for (var index = 0; index < topsis.length; index++) {
    for (var i = 0; i < topsis[0].length; i++) {
      final c = i + 1;
      final kuadrat = topsis[index]['c$c'] * topsis[index]['c$c'];
      kuadratList.add(kuadrat);
    }
  }
  sumKuadrat();
}

sumKuadrat() {
  sumKuadratList.clear();
  final increment = kuadratList.length / topsis[0].length;
  final cLength = kuadratList.length / increment;
  for (var i = 0; i < cLength; i++) {
    num? sumF = 0;
    for (var index = 0; index < topsis.length; index++) {
      final num? sumKuadrat =
          (index == 0) ? 0 : sumF! + kuadratList[i + index * cLength.toInt()]
          // +
          // kuadratList[i + 2 * cLength.toInt()]
          ;
      sumF = sumKuadrat;
    }
    final sumFFinal = sumF! + kuadratList[i];
    sumKuadratList.add(sumFFinal);
  }
  normalisasi();
}

normalisasi() {
  normalisasiList.clear();
  for (var index = 0; index < topsis.length; index++) {
    for (var i = 0; i < topsis[0].length; i++) {
      final c = i + 1;
      final normalisasi = topsis[index]['c$c'] / sqrt(sumKuadratList[i]);
      normalisasiList.add(normalisasi);
    }
  }
  normalisasiTerbobot();
}

normalisasiTerbobot() {
  normalisasiTerbobotList.clear();
  for (num? index = 0;
      index! < normalisasiList.length;
      index = index + bobot[0].length) {
    for (var i = 0; i < bobot[0].length; i++) {
      final inx = i + 1;
      final normalisasiTerbobot =
          normalisasiList[index.toInt() + i] * bobot[0]['c$inx'];
      normalisasiTerbobotList.add(normalisasiTerbobot);
    }
  }
  solusiIdeal();
}

solusiIdeal() {
  solusiIdealList.clear();
  for (int index = 0; index < bobot[0].length; index++) {
    num i = 0;
    var maxI = normalisasiTerbobotList.length;
    do {
      final int iIndex = i.toInt() + index;
      final positif = normalisasiTerbobotList[iIndex];
      solusiIdealList.add(positif);
      i = i + bobot[0].length;
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
    final solusiIdealF = [];
    for (var i = 0; i < topsis.length; i++) {
      solusiIdealF.add(solusiIdealList[index + i]);
    }
    final max = solusiIdealF.reduce((curr, next) => curr > next ? curr : next);
    final min = solusiIdealF.reduce((curr, next) => curr < next ? curr : next);
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
  for (num? i = 0;
      i! < normalisasiTerbobotList.length;
      i = i + bobot[0].length.toInt()) {
    for (var index = 0; index < bobot[0].length; index++) {
      //+
      final totalPositif =
          normalisasiTerbobotList[i.toInt() + index] - maxList[index];
      final kuadratPositif = totalPositif * totalPositif;
      totalPositifList.add(kuadratPositif);

      //-
      final totalNegatif =
          normalisasiTerbobotList[i.toInt() + index] - minList[index];
      final kuadratNegatif = totalNegatif * totalNegatif;
      totalNegatifList.add(kuadratNegatif);
    }
  }

  for (num? i = 0;
      i! < normalisasiTerbobotList.length;
      i = i.toInt() + bobot[0].length.toInt()) {
    totalPositifListIndex.clear();
    totalNegatifListIndex.clear();
    for (num? index = 0; index! < bobot[0].length.toInt(); index++) {
      //+
      final totalIndexPositif = totalPositifList[index.toInt() + i.toInt()];
      totalPositifListIndex.add(totalIndexPositif);

      //-
      final totalIndexNegatif = totalNegatifList[index.toInt() + i.toInt()];
      totalNegatifListIndex.add(totalIndexNegatif);
    }

    //+
    final sumPositif = sqrt(totalPositifListIndex.fold(
        0, (previous, current) => previous + current));
    sqrtSumTotalPositifList.add(sumPositif);

    //-
    final sumNegatif = sqrt(totalNegatifListIndex.fold(
        0, (previous, current) => previous + current));
    sqrtSumTotalNegatifList.add(sumNegatif);
  }
  preferensi();
}

preferensi() {
  preferensiList.clear();
  for (var index = 0; index < topsis.length; index++) {
    final preferensi = sqrtSumTotalNegatifList[index] /
        (sqrtSumTotalNegatifList[index] + sqrtSumTotalPositifList[index]);
    preferensiList.add(preferensi);
  }
  rakingList.clear();
  for (var i = 0; i < preferensiList.length; i++) {
    final decToInt = preferensiList[i] * 10;
    rakingList.add(decToInt);
  }
}

raking() {
  // var ascending = rakingList..sort();
  // var descending = ascending.reversed;
  // print(descending);
}
