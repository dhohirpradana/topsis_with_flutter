import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topsis_tanaman_hias/Pages/atom/hint_text.dart';
import 'package:topsis_tanaman_hias/Pages/atom/label_text.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';

textFormField(index, i) => TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            if (value == '0') {
              return 'Nilai tidak boleh 0(nol)';
            }
            return 'Harus diisi';
          }
          return null;
        },
        initialValue:
            ((topsis[i]['c' + (index + 1).toString()]).toString() == '0')
                ? ''
                : (topsis[i]['c' + (index + 1).toString()]).toString(),
        onChanged: (value) =>
            topsis[i]['c' + (index + 1).toString()] = int.parse(value),
        decoration: InputDecoration(
            hintText: hintText(index), labelText: labelText(index)));
