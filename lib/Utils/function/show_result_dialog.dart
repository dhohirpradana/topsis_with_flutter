import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

resultDialog(context, preferensiList) {
  showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text("HASIL"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0; i < preferensiList.length; i++)
                  Text(
                    'Alternatif ' +
                        (i + 1).toString() +
                        ' : ' +
                        preferensiList[i].toString().substring(
                            0,
                            (preferensiList[i].toString().length > 6)
                                ? 6
                                : preferensiList[i].toString().length),
                    style: TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ));
}
