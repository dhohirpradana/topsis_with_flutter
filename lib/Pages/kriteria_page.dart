import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/alternatif_textfield.dart';
import 'package:topsis_tanaman_hias/Pages/kriteria_textfield.dart';

class CriteriaPage extends StatefulWidget {
  // static List<String> kriteriaList = [null];
  static List<String> bobotList = [null];
  static List<String> alternatifList = [null];
  static List<String> nilaiKriteriaAlternatif = [null];
  @override
  _CriteriaPageState createState() => _CriteriaPageState();
}

class _CriteriaPageState extends State<CriteriaPage> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> _getKriteria() {
    List<Widget> friendsTextFieldsList = [];
    for (int i = 0; i < CriteriaPage.bobotList.length; i++) {
      friendsTextFieldsList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('C' + (i + 1).toString()),
            Row(
              children: [
                Expanded(child: TextFields(i)),
                SizedBox(
                  width: 16,
                ),
                // we need add button at last friends row only
                _addRemoveButton(i == CriteriaPage.bobotList.length - 1, i),
              ],
            ),
          ],
        ),
      ));
    }
    return friendsTextFieldsList;
  }

  List<Widget> _getAlternatif() {
    List<Widget> alternatifTextFieldsList = [];
    for (int i = 0; i < CriteriaPage.alternatifList.length; i++) {
      alternatifTextFieldsList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('A' + (i + 1).toString()),
            Row(
              children: [
                Expanded(child: AlternatifTextFields(i)),
                SizedBox(
                  width: 16,
                ),
                // we need add button at last friends row only
                _addRemoveAlternatifButton(
                    i == CriteriaPage.alternatifList.length - 1, i),
              ],
            ),
          ],
        ),
      ));
    }
    return alternatifTextFieldsList;
  }

  Widget _addRemoveAlternatifButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          CriteriaPage.alternatifList.insert(0, null);
        } else
          CriteriaPage.alternatifList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          // CriteriaPage.kriteriaList.insert(0, null);
          CriteriaPage.bobotList.insert(0, null);
        } else {
          // CriteriaPage.kriteriaList.removeAt(index);
          CriteriaPage.bobotList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Kriteria'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kriteria (C)',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    ..._getKriteria(),
                    Text(
                      'Alternatif (A)',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    ..._getAlternatif(),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(CriteriaPage.nilaiKriteriaAlternatif);
                }
              },
              child: Text('HITUNG'),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
