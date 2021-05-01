import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';

Widget widgetKriteriaHasilPage(context) => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Kriteria',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
            onTap: null,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
            ),
            title: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 2.5),
                child: Text("Bobot",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))),
        for (var i = 0; i < bobot[0].length; i++)
          ListTile(
            onTap: null,
            leading: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                  (i == 0)
                      ? 'Tinggi'
                      : (i == 1)
                          ? 'Kepekatan warna hijau daun'
                          : (i == 2)
                              ? 'Kesehatan tanaman'
                              : (i == 3)
                                  ? 'Kesempurnaan bagian tanaman'
                                  : 'Bunga',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            title: Row(
              children: <Widget>[
                Expanded(
                    child: Text(bobot[0]['c' + (i + 1).toString()].toString()))
              ],
            ),
          ),
      ],
    );

Widget widgetDataAnalisaHasilPage() => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Data Analisa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(children: <Widget>[
            for (var i = 0; i < bobot[0].length; i++)
              Expanded(
                  child: Text('C' + (i + 1).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        for (var index = 0; index < topsis.length; index++)
          ListTile(
            onTap: null,
            leading: Text('A' + (index + 1).toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            title: Row(
              children: <Widget>[
                for (var i = 0; i < bobot[0].length; i++)
                  Expanded(
                      child: Text(
                          topsis[index]['c' + (i + 1).toString()].toString()))
              ],
            ),
          ),
      ],
    );

Widget widgetNormalisasiHasilPage() => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('1. Normalisasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(children: <Widget>[
            for (var i = 0; i < bobot[0].length; i++)
              Expanded(
                  child: Text('C' + (i + 1).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        for (var index = 0;
            index < normalisasiList.length / bobot[0].length;
            index++)
          ListTile(
            onTap: null,
            leading: Text('A' + (index + 1).toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            title: Row(
              children: <Widget>[
                for (var i = 0; i < bobot[0].length; i++)
                  Expanded(
                      child: Text(normalisasiList[index * i]
                          .toString()
                          .substring(
                              0,
                              (normalisasiList[index * i].toString().length > 6)
                                  ? 6
                                  : normalisasiList[index * i]
                                      .toString()
                                      .length)))
              ],
            ),
          ),
      ],
    );

Widget widgetNormalisasiTerbobotHasilPage() => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('2. Normalisasi Terbobot',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(children: <Widget>[
            for (var i = 0; i < bobot[0].length; i++)
              Expanded(
                  child: Text('C' + (i + 1).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        for (var index = 0;
            index < normalisasiTerbobotList.length / bobot[0].length;
            index++)
          ListTile(
            onTap: null,
            leading: Text('A' + (index + 1).toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            title: Row(
              children: <Widget>[
                for (var i = 0; i < bobot[0].length; i++)
                  Expanded(
                      child: Text(normalisasiTerbobotList[index * i]
                          .toString()
                          .substring(
                              0,
                              (normalisasiTerbobotList[index * i]
                                          .toString()
                                          .length >
                                      6)
                                  ? 6
                                  : normalisasiTerbobotList[index * i]
                                      .toString()
                                      .length)))
              ],
            ),
          ),
      ],
    );

Widget widgetSolusiIdealHasilPage() => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('3. Solusi Ideal Positif dan Negatif',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(children: <Widget>[
            for (var i = 0; i < bobot[0].length; i++)
              Expanded(
                  child: Text('C' + (i + 1).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        for (var index = 0; index < 2; index++)
          ListTile(
            onTap: null,
            leading: Text((index == 0) ? '+' : '-',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            title: Row(
              children: <Widget>[
                for (var i = 0; i < bobot[0].length; i++)
                  Expanded(
                      child: (index == 0)
                          ? Text(maxList[i].toString().substring(
                              0,
                              (maxList[i].toString().length > 6)
                                  ? 6
                                  : minList[i].toString().length))
                          : Text(minList[i].toString().substring(
                              0,
                              (minList[i].toString().length > 6)
                                  ? 6
                                  : minList[i].toString().length)))
              ],
            ),
          ),
      ],
    );

Widget widgetTotalHasilPage() => Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('4. Total',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(children: <Widget>[
            for (var i = 0; i < 3; i++)
              Expanded(
                  child: Text(
                      (i == 0)
                          ? 'Positif'
                          : (i == 1)
                              ? 'Negatif'
                              : 'Preferensi',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
          ]),
        ),
        for (var index = 0; index < topsis.length; index++)
          ListTile(
            onTap: null,
            leading: Text('A' + (index + 1).toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            title: Row(
              children: <Widget>[
                Expanded(
                    child: (Text(sqrtSumTotalPositifList[index]
                        .toString()
                        .substring(
                            0,
                            (sqrtSumTotalPositifList[index].toString().length >
                                    6)
                                ? 6
                                : sqrtSumTotalPositifList[index]
                                    .toString()
                                    .length)))),
                Expanded(
                    child: (Text(sqrtSumTotalNegatifList[index]
                        .toString()
                        .substring(
                            0,
                            (sqrtSumTotalNegatifList[index].toString().length >
                                    6)
                                ? 6
                                : sqrtSumTotalNegatifList[index]
                                    .toString()
                                    .length)))),
                Expanded(
                    child: Container(
                  color: Colors.yellow[200],
                  child: (Text(preferensiList[index].toString().substring(
                      0,
                      (preferensiList[index].toString().length > 6)
                          ? 6
                          : preferensiList[index].toString().length))),
                ))
              ],
            ),
          ),
      ],
    );
