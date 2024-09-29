import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_manager/db/Report_data_.dart';

import '../Screens/screenanalyticscategory.dart';
import '../model/transaction.dart/transaction.dart';

class AdvancedDataExpense extends StatelessWidget {
  final value_notifer_index;
  const AdvancedDataExpense({super.key, required this.value_notifer_index});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: advanced_data_notifier_expense,
        builder:
            (BuildContext context, List<TransactionModel> newlist, Widget? _) {
          final List<List> LIST = List_giver();
          if (LIST[0].isEmpty) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    "No Expense To Display",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: Text(
                    "Expense Analytics",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                for (var i = 0; i < LIST[0].length; i++)
                  Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        ReportFunctions.instance
                            .Get_data_for_screenalalyticscategory(
                                value_notifer_index, LIST[0][i]);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ScreenCategoryAnalytics(
                            category: LIST[0][i],
                            value_notifer_index: value_notifer_index,
                          );
                        }));
                      },
                      subtitle: Text(
                        "Amount: Rs ${LIST[1][i]}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      title: Text(
                        "${LIST[0][i]}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
              ],
            );
          }
        });
  }
}

List<List> List_giver() {
  final lst = advanced_data_notifier_expense.value;
  final List _lst2 = [];
  final List _lst3 = [];
  for (var i = 0; i < lst.length; i++) {
    final single = lst[i];
    if (!_lst2.contains(single.category.name)) {
      _lst2.add(single.category.name);
    }
  }
  for (var i = 0; i < _lst2.length; i++) {
    double sum = 0;
    for (var j = 0; j < lst.length; j++) {
      final single = lst[j];
      if (single.category.name == _lst2[i]) {
        sum += single.amount;
      }
    }
    _lst3.insert(i, sum);
  }
  return [_lst2, _lst3];
}
