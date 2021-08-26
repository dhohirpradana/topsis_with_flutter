import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Utils/List/topsis_list.dart';
import 'package:topsis_tanaman_hias/Utils/function/topsis_function.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/alternatif_title.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/snackbar.dart';
import 'package:topsis_tanaman_hias/Utils/molekul/textform_field.dart';

class AlternatifPage extends StatefulWidget {
  @override
  _AlternatifPageState createState() => _AlternatifPageState();
}

class _AlternatifPageState extends State<AlternatifPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            Text('ALTERNATIF'),
        // IconButton(
        //   onPressed: () {
        //     _displayDialog(context);
        //   },
        //   icon: Icon(Icons.help),
        // )
        // ],
        // ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xffb1453b), Colors.purple]),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                for (var i = 0; i < topsis.length; i++)
                  Column(
                    children: [
                      alternatifTitle(context, addRemoveButton(i), i),
                      for (var index = 0; index < bobot[0].length; index++)
                        TextFormFieldWidget(i: i, index: index),
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
                  height: 55,
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
