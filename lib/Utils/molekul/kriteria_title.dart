import 'package:flutter/material.dart';

Widget kriteriaTitle(context, i) => Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
          // color: Color(0xffb1453b).withAlpha(50),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kriteria ' +
                    (i + 1).toString() +
                    ' (C' +
                    (i + 1).toString() +
                    ')',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
