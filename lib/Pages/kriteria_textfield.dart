import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/kriteria_page.dart';

class TextFields extends StatefulWidget {
  final int index;
  TextFields(this.index);
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  TextEditingController _parameterController;

  //bobot controller
  TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _parameterController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _parameterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _parameterController.text = CriteriaPage.bobotList[widget.index] ?? '';
      _nameController.text = CriteriaPage.bobotList[widget.index] ?? '';
    });
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _parameterController,
          onChanged: (v) => CriteriaPage.bobotList[widget.index] = v,
          decoration: InputDecoration(
              hintText: 'Parameter', labelText: 'Masukan parameter'),
          validator: (v) {
            if (v.trim().isEmpty) return 'Harus diisi';
            return null;
          },
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _nameController,
          onChanged: (v) => CriteriaPage.bobotList[widget.index] = v,
          decoration:
              InputDecoration(hintText: 'Masukan bobot', labelText: 'Bobot'),
          validator: (v) {
            if (v.trim().isEmpty) return 'Harus diisi';
            return null;
          },
        ),
      ],
    );
  }
}
