import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:topsis_tanaman_hias/Pages/alternatif_page.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';
import 'package:topsis_tanaman_hias/Utils/atom/hint_text.dart';
import 'package:topsis_tanaman_hias/Utils/atom/label_text.dart';
import 'package:topsis_tanaman_hias/Utils/function/topsis_function.dart';

class TextFormFieldWidget extends StatefulWidget {
  final int i, index;
  const TextFormFieldWidget({Key? key, required this.i, required this.index})
      : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    final i = widget.i;
    final index = widget.index;
    var params = <String>[
      (index == 1)
          ? 'Hijau Muda'
          : (index == 2)
              ? 'Kurang Sehat'
              : (index == 3)
                  ? 'Kurang Baik'
                  : 'Kurang Baik',
      (index == 1)
          ? 'Hijau Agak Muda'
          : (index == 2)
              ? 'Cukup Sehat'
              : 'Cukup Baik',
      (index == 1)
          ? 'Hijau Agak Tua'
          : (index == 2)
              ? 'Sehat'
              : 'Baik',
      (index == 1)
          ? 'Hijau Tua'
          : (index == 2)
              ? 'Sangat Sehat'
              : 'Sangat Baik',
    ];

    String? _dropDownValue = (index != 0)
        ? (topsis[i]['c' + (index + 1).toString()] != 0)
            ? params[topsis[i]['c' + (index + 1).toString()] - 1]
            : params[0]
        : null;

    return Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 7),
        child: (index == 0)
            ? TextFormField(
                inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
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
                showCursor: true,
                readOnly: false,
                controller: _controller[i]
                  ..text = ((topsis[i]['c' + (index + 1).toString()])
                              .toString() ==
                          '0')
                      ? ''
                      : (topsis[i]['c' + (index + 1).toString()]).toString(),
                onChanged: (value) => (value == '')
                    ? topsis[i]['c' + (index + 1).toString()] = 0
                    : topsis[i]['c' + (index + 1).toString()] =
                        int.parse(value),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54, width: 1.0),
                    ),
                    hintText: hintText(index),
                    labelText: labelText(index)))
            : Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black54,
                        width: 1,
                      ),
                    ),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(canvasColor: Colors.green[50]),
                        child: DropdownButton(
                          elevation: 0,
                          hint: _dropDownValue == null
                              ? Text(labelText(index))
                              : Text(
                                  _dropDownValue,
                                  style: TextStyle(color: Colors.black),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.black),
                          items: params.map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            setState(
                              () {
                                topsis[i]['c' + (index + 1).toString()] =
                                    params.indexOf(val.toString()) + 1;
                                print(topsis[i]['c' + (index + 1).toString()]);
                                _dropDownValue = val.toString();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 8,
                      child: Container(
                          padding:
                              EdgeInsets.only(bottom: 0, left: 5, right: 5),
                          color: Colors.white,
                          child: Text(
                            labelText(index),
                            style: TextStyle(color: Colors.black54),
                          ))),
                ],
              ));
  }
}

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
              bobot[0]['c' + (index + 1).toString()] = 0;
              setC(index + 1, 0);
            } else {
              bobot[0]['c' + (index + 1).toString()] = int.parse(value);
              // setC(index + 1, int.parse(value));
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
