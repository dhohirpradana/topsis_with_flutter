import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/function/show_result_dialog.dart';
import 'package:topsis_tanaman_hias/Utils/function/topsis_function.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/snackbar.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/textform_field.dart';

class TopsisPage extends StatefulWidget {
  @override
  _TopsisPageState createState() => _TopsisPageState();
}

class _TopsisPageState extends State<TopsisPage> {
  String preferensiText = '';

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffb1453b),
        title: Text('SPK PEMILIHAN TANAMAN HOYA CARNOSA (TOPSIS)'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                for (var i = 0; i < topsis.length; i++)
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alternatif ' + (i + 1).toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Visibility(
                              visible: (topsis.length <= 1) ? false : true,
                              child: addRemoveButton(i)),
                        ],
                      ),
                      for (var index = 0; index < bobot[0].length; index++)
                        textFormField(index, i),
                      (topsis.length == i + 1)
                          ? SizedBox(
                              width: double.infinity,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Color(0xff5d8d5d),
                                  child: Text('Tambah Alternatif'),
                                  onPressed: () {
                                    addTopsis(topsis, i);
                                    setState(() {});
                                  }),
                            )
                          : SizedBox(),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                      // ignore: deprecated_member_use
                      RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xffb1453b),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await kuadrat();
                        resultDialog(context, preferensiList);
                      }
                    },
                    child: Text('Hitung'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addRemoveButton(i) => IconButton(
      onPressed: () {
        if (2 == topsis.length) {
          showFlushBar(context);
        } else {
          topsis.removeAt(i);
          print(topsis);
          setState(() {});
        }
      },
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ));
}
