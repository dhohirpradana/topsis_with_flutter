import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';
import 'package:topsis_tanaman_hias/Utils/atom/hint_text.dart';
import 'package:topsis_tanaman_hias/Utils/atom/label_text.dart';
import 'package:topsis_tanaman_hias/Utils/function/topsis_function.dart';

textFormField(index, i) => Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 7),
      child: TextFormField(
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
          key: Key(index.toString()),
          initialValue:
              ((topsis[i]['c' + (index + 1).toString()]).toString() == '0')
                  ? ''
                  : (topsis[i]['c' + (index + 1).toString()]).toString(),
          onChanged: (value) => (value == '')
              ? topsis[i]['c' + (index + 1).toString()] = 0
              : topsis[i]['c' + (index + 1).toString()] = int.parse(value),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
              hintText: hintText(index),
              labelText: labelText(index))),
    );

textFormFieldKriteria(index) => Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 7),
      child: TextFormField(
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
          key: Key(index.toString()),
          initialValue:
              ((bobot[0]['c' + (index + 1).toString()]).toString() == '0')
                  ? ''
                  : (bobot[0]['c' + (index + 1).toString()]).toString(),
          onChanged: (value) {
            if (value == '') {
              // bobot[0]['c' + (index + 1).toString()] = 0;
              setC(index + 1, 0);
            } else {
              // bobot[0]['c' + (index + 1).toString()] = int.parse(value);
              setC(index + 1, int.parse(value));
            }
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black54, width: 1.0),
              ),
              hintText: hintTextKriteria(index),
              labelText: labelText(index))),
    );
