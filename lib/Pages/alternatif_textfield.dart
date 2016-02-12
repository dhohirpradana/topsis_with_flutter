import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/kriteria_page.dart';

class AlternatifTextFields extends StatefulWidget {
  final int index;
  AlternatifTextFields(this.index);
  @override
  _AlternatifTextFieldsState createState() => _AlternatifTextFieldsState();
}

class _AlternatifTextFieldsState extends State<AlternatifTextFields> {
  TextEditingController _parameterController;
  // TextEditingController _nameController;
  TextEditingController _nilaiCntroller;
  @override
  void initState() {
    super.initState();
    // _nameController = TextEditingController();
    _parameterController = TextEditingController();
    _nilaiCntroller = TextEditingController();
  }

  @override
  void dispose() {
    // _nameController.dispose();
    _parameterController.dispose();
    _nilaiCntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _parameterController.text =
          CriteriaPage.alternatifList[widget.index] ?? '';
      _nilaiCntroller.text =
          CriteriaPage.nilaiKriteriaAlternatif[widget.index] ?? '';
    });
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _parameterController,
          onChanged: (v) => CriteriaPage.alternatifList[widget.index] = v,
          decoration: InputDecoration(
              hintText: 'Alternatif', labelText: 'Masukan nama Alternatif'),
          validator: (v) {
            if (v.trim().isEmpty) return 'Harus diisi';
            return null;
          },
        ),
        Column(
          children: [
            for (var i = 0;
                i < CriteriaPage.nilaiKriteriaAlternatif.length;
                i++)
              TextFormField(
                keyboardType: TextInputType.number,
                // controller: _nilaiCntroller,
                onChanged: (v) =>
                    CriteriaPage.nilaiKriteriaAlternatif[widget.index] = v,
                decoration: InputDecoration(
                    hintText: 'Masukan Nilai C' + (i + 1).toString(),
                    labelText: 'Nilai C' + (i + 1).toString()),
                validator: (v) {
                  if (v.trim().isEmpty) return 'Harus diisi';
                  return null;
                },
              ),
          ],
        ),
      ],
    );
  }
}
