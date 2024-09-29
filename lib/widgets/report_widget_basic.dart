// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, non_constant_identifier_names
import 'package:flutter/material.dart';
import '../db/Report_data_.dart';

class reportwidget extends StatelessWidget {
  const reportwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: basic_data_notifier,
      builder: (context, data, child) {
        final basicinfo = valueparser(data);
        return Container(
          padding: const EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: Colors.white70, border: Border.all()),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${basicinfo[0]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${basicinfo[1]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "${basicinfo[2]}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
              ]),
        );
      },
    );
  }

  List valueparser(List lst) {
    String _first = "Money earned: ";
    String _second = "Money Spent  : ";
    String _third = "Money Left     : ";
    _first += lst[0].toString();
    _second += lst[1].toString();
    _third += lst[2].toString();
    return [_first, _second, _third];
  }
}
