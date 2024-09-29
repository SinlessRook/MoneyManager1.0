import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/db/Report_data_.dart';
import 'package:money_manager/widgets/Advanced_Data2.dart';
import 'package:money_manager/widgets/Expense_pie_chart.dart';
import 'package:money_manager/widgets/Advanced_Data.dart';
import '../widgets/report_widget_basic.dart';

class ScreenAnalytics extends StatefulWidget {
  const ScreenAnalytics({super.key});

  @override
  State<ScreenAnalytics> createState() => _ScreenAnalyticsState();
}

class _ScreenAnalyticsState extends State<ScreenAnalytics> {
  final _value = [
    "This Month",
    "Today",
    "Last Month",
    "All Time",
  ];

  ValueNotifier<int> dropdownvaluenotifier = ValueNotifier(0);
  String dropdownvalue = "This Month";
  @override
  Widget build(BuildContext context) {
    ReportFunctions.instance.Get_basic_info(0);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
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
              setState(() {
                dropdownvalue = value!;
                dropdownvaluenotifier.value = _value.indexOf(value);
              });
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ValueListenableBuilder(
            valueListenable: dropdownvaluenotifier,
            builder: (BuildContext context, int index, Widget? _) {
              ReportFunctions.instance.Get_basic_info(index);
              return const reportwidget();
            }),
        const SizedBox(
          height: 15,
        ),
        ValueListenableBuilder(
            valueListenable: dropdownvaluenotifier,
            builder: (BuildContext context, int index, Widget? _) {
              ReportFunctions.instance.Get_data_for_first_pie_chart(index);
              return const PieChartForExpense();
            }),
        const SizedBox(
          height: 15,
        ),
        ValueListenableBuilder(
            valueListenable: dropdownvaluenotifier,
            builder: (BuildContext context, int index, Widget? _) {
              ReportFunctions.instance.application_data(index);
              return AdvancedDataIncome(
                value_notifer_index: index,
              );
            }),
        ValueListenableBuilder(
            valueListenable: dropdownvaluenotifier,
            builder: (BuildContext context, int index, Widget? _) {
              ReportFunctions.instance.application_data(index);
              return AdvancedDataExpense(
                value_notifer_index: index,
              );
            })
      ]),
    );
  }
}
