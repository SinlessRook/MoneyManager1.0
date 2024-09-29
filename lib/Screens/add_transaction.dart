import 'package:flutter/material.dart';
import 'package:money_manager/db/categories_db_functions.dart';
import 'package:money_manager/model/category/category.dart';
import 'package:money_manager/model/transaction.dart/transaction.dart';

import '../db/transaction_db_funtions.dart';

class AddTransaction extends StatefulWidget {
  static const routeName = "Add-Transaction";

  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selecteddate;
  CategoryType? _selectedcategorytype;
  CatecoryModel? _selectedcategory;
  String? _CategoryID;

  TextEditingController _purposetexteditingcontroller = TextEditingController();
  TextEditingController _amounttexteditingcontroller = TextEditingController();

  @override
  void initState() {
    _selectedcategorytype = CategoryType.income;
    super.initState();
  }

  // Purpose
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Money Management"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Purpose
                  TextField(
                    controller: _purposetexteditingcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Purpose"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Amount
                  TextField(
                      controller: _amounttexteditingcontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Amount")),
                  const SizedBox(
                    height: 15,
                  ),
                  //Date
                  TextButton.icon(
                      onPressed: () async {
                        final _selected_dateTemp = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
                            lastDate: DateTime.now());
                        if (_selected_dateTemp == null) {
                          return;
                        } else {
                          setState(() {
                            _selecteddate = _selected_dateTemp;
                          });
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: Text(_selecteddate == null
                          ? "Select Date"
                          : _selecteddate!.toString())),
                  //radio button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: CategoryType.income,
                              groupValue: _selectedcategorytype,
                              onChanged: (newvalue) {
                                setState(() {
                                  _selectedcategorytype = CategoryType.income;
                                  _CategoryID = null;
                                });
                              }),
                          const Text("Income"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: CategoryType.expense,
                              groupValue: _selectedcategorytype,
                              onChanged: (newvalue) {
                                setState(() {
                                  _selectedcategorytype = CategoryType.expense;
                                  _CategoryID = null;
                                });
                              }),
                          const Text("Expense"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Category
                  DropdownButton(
                      hint: const Text("Select Category"),
                      value: _CategoryID,
                      items: (_selectedcategorytype == CategoryType.income
                              ? Categorydb().incomecategorynotifier
                              : Categorydb().expensecategorynotifier)
                          .value
                          .map((e) {
                        return DropdownMenuItem(
                          value: e.id,
                          child: Text(e.name),
                          onTap: () {
                            _selectedcategory = e;
                          },
                        );
                      }).toList(),
                      onChanged: (selectedvalue) {
                        setState(() {
                          _CategoryID = selectedvalue;
                        });
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  //submit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            addTransaction();
                          },
                          child: const Text("SUBMIT")),
                    ],
                  )
                ],
              ),
            )));
  }

  Future<void> addTransaction() async {
    final _purposetext = _purposetexteditingcontroller.text;
    final _amounttext = _amounttexteditingcontroller.text;
    if (_purposetext.isEmpty) {
      print(1);
      return;
    }
    if (_amounttext.isEmpty) {
      print(2);
      return;
    }
    if (_selecteddate == null) {
      print(2);
      return;
    }
    if (_CategoryID == null) {
      print(2);
      return;
    }
    if (_selectedcategory == null) {
      print(2);
      return;
    }
    final _pasrsed_amount = double.tryParse(_amounttext);
    if (_pasrsed_amount == null) {
      print(2);
      return;
    }
    final _model = TransactionModel(
      purpose: _purposetext,
      amount: _pasrsed_amount,
      date: _selecteddate!,
      type: _selectedcategorytype!,
      category: _selectedcategory!,
    );
    await TransactionDB.instance.addTransaction(_model);
    Navigator.of(context).pop();
    TransactionDB.instance.refresh();
  }
}
