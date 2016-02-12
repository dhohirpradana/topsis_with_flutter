import 'dart:math';

import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';

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

int sumF;
sumKuadrat() {
  sumKuadratList.clear();
  final increment = kuadratList.length / topsis[0].length;
  final cLength = kuadratList.length / increment;
  // print(cLength);
  for (var i = 0; i < cLength; i++) {
    for (var index = 0; index < topsis.length; index++) {
      final sum = kuadratList[i];
      final sumKuadrat =
          (index >= 1) ? sum + kuadratList[i + cLength.toInt()] : sum
          // +
          // kuadratList[i + 2 * cLength.toInt()]
          ;
      sumF = sumKuadrat;
    }
    sumKuadratList.add(sumF);
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
      // solusiIdealList[index + 2]
    ].reduce((curr, next) => curr > next ? curr : next);
    final min = [
      solusiIdealList[index],
      solusiIdealList[index + 1],
      // solusiIdealList[index + 2]
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
      final totalPositif = normalisasiTerbobotList[i + index] - maxList[index];
      final kuadratPositif = totalPositif * totalPositif;
      totalPositifList.add(kuadratPositif);

      //-
      final totalNegatif = normalisasiTerbobotList[i + index] - minList[index];
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
  for (var index = 0; index < topsis.length; index++) {
    final preferensi = sqrtSumTotalNegatifList[index] /
        (sqrtSumTotalNegatifList[index] + sqrtSumTotalPositifList[index]);
    // print(preferensi);
    preferensiList.add(preferensi);
  }
}
