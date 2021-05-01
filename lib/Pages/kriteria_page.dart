import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/textform_field.dart';

class KriteriaPage extends StatefulWidget {
  @override
  _KriteriaPageState createState() => _KriteriaPageState();
}

class _KriteriaPageState extends State<KriteriaPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffb1453b),
          title: Text('KRITERIA'),
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        for (var i = 0; i < bobot[0].length; i++)
                          Column(children: [
                            // kriteriaTitle(context, i),
                            textFormFieldKriteria(i),
                          ]),
                      ],
                    )))));
  }
}
