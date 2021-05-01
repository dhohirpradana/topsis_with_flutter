import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';

Widget alternatifTitle(context, child, i) => Wrap(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 5),
          // color: Color(0xffb1453b).withAlpha(50),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Alternatif ' + (i + 1).toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Visibility(
                  visible: (topsis.length <= 1) ? false : true, child: child),
            ],
          ),
        ),
      ],
    );
