import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/categories_db_functions.dart';
import 'package:money_manager/db/transaction_db_funtions.dart';
import 'package:money_manager/model/category/category.dart';
import '../model/transaction.dart/transaction.dart';

class ScreenTransaction extends StatefulWidget {
  const ScreenTransaction({super.key});

  @override
  State<ScreenTransaction> createState() => _ScreenTransactionState();
}

class _ScreenTransactionState extends State<ScreenTransaction> {
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    Categorydb.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifer,
        builder: (BuildContext ctx, List<TransactionModel> newlist, Widget? _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (ctx, index) {
                  final _value = newlist[index];
                  return Card(
                      elevation: 5,
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              TransactionDB.instance
                                  .deleteTransaction(_value.transactionId!);
                            },
                            icon: const Icon(Icons.delete)),
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: _value.type == CategoryType.income
                              ? Colors.green
                              : Colors.red,
                          child: Text(
                            textAlign: TextAlign.center,
                            parseDate(_value.date),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text("Rs ${_value.amount}"),
                        subtitle:
                            Text("${_value.category.name} (${_value.purpose})"),
                      ));
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: newlist.length),
          );
        });
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _split_date = _date.split(" ");
    return "${_split_date.last}\n${_split_date.first}";
  }
}
