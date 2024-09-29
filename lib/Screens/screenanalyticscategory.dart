// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/Report_data_.dart';

import '../model/category/category.dart';

class ScreenCategoryAnalytics extends StatefulWidget {
  final category;
  final value_notifer_index;
  const ScreenCategoryAnalytics(
      {super.key, required this.category, required this.value_notifer_index});

  @override
  State<ScreenCategoryAnalytics> createState() =>
      _ScreenCategoryAnalyticsState();
}

class _ScreenCategoryAnalyticsState extends State<ScreenCategoryAnalytics> {
  int? notifiervalue;

  @override
  void initState() {
    notifiervalue = widget.value_notifer_index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> dropdownvaluenotifier2 = ValueNotifier(notifiervalue!);
    final _value = [
      "This Month",
      "Today",
      "Last Month",
      "All Time",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: dropdownvaluenotifier2,
              builder: (BuildContext context, int value, Widget? _) {
                final _lst = screenanalyticscategory_notifier.value;
                String dropdownvalue = _value[dropdownvaluenotifier2.value];
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 20,
                        // Initial Value
                        value: dropdownvalue,
                        items: _value.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          dropdownvalue = value!;
                          dropdownvaluenotifier2.value = _value.indexOf(value);
                          ReportFunctions.instance
                              .Get_data_for_screenalalyticscategory(
                                  dropdownvaluenotifier2.value,
                                  widget.category);
                          dropdownvaluenotifier2.notifyListeners();
                        },
                      ),
                    ),
                    for (var i = 0; i < _lst.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  _lst[i].type == CategoryType.income
                                      ? Colors.green
                                      : Colors.red,
                              child: Text(
                                textAlign: TextAlign.center,
                                parseDate(_lst[i].date),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text("Rs ${_lst[i].amount}"),
                            subtitle: Text(
                                "${_lst[i].category.name} (${_lst[i].purpose})"),
                          ),
                        ),
                      )
                  ],
                );
              })
        ],
      )),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _split_date = _date.split(" ");
    return "${_split_date.last}\n${_split_date.first}";
  }
}
