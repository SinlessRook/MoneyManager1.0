import 'package:flutter/material.dart';
import 'package:money_manager/db/Report_data_.dart';
import 'package:money_manager/model/transaction.dart/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartForExpense extends StatelessWidget {
  const PieChartForExpense({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: piechartnotifier,
      builder:
          (BuildContext context, List<TransactionModel> newlist, Widget? _) {
        final List<_PieData> pieData = parse_data(newlist);
        final double _total_expense = totalexpense(newlist);
        return Center(
            child: SfCircularChart(
                palette: const <Color>[
                  Color.fromRGBO(16, 130, 222, 1),
                  Color.fromRGBO(139, 211, 61, 1),
                  Color.fromARGB(255, 240, 8, 8),
                  Color.fromRGBO(192, 108, 132, 1),
                  Color.fromRGBO(246, 114, 128, 1),
                  Color.fromRGBO(248, 177, 149, 1),
                  Color.fromRGBO(0, 168, 181, 1),
                  Color.fromRGBO(73, 76, 162, 1),
                  Color.fromRGBO(255, 205, 96, 1),
                  Color.fromRGBO(255, 240, 219, 1),
                  Color.fromRGBO(238, 238, 238, 1)
                ],
                enableMultiSelection: false,
                selectionGesture: ActivationMode.none,
                title: ChartTitle(
                    text: 'Expense Chart',
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                legend: const Legend(isVisible: true),
                series: <PieSeries<_PieData, String>>[
                  PieSeries<_PieData, String>(
                      explode: true,
                      explodeIndex: 0,
                      dataSource: pieData,
                      xValueMapper: (_PieData data, _) =>
                          data.purpose +
                          " (${((data.amount / _total_expense) * 100).round()}% )",
                      yValueMapper: (_PieData data, _) => data.amount,
                      dataLabelMapper: (_PieData data, _) => data.text,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true)),
                ]));
      },
    );
  }

  List<_PieData> parse_data(List<TransactionModel> lst) {
    final List<_PieData> _required_list = [];
    for (var i = 0; i < lst.length; i++) {
      _required_list.add(_PieData(
          purpose: lst[i].purpose,
          amount: lst[i].amount,
          text: lst[i].category.name));
    }
    return _required_list;
  }

  double totalexpense(List<TransactionModel> lst) {
    double _expense = 0;
    for (var i = 0; i < lst.length; i++) {
      _expense += lst[i].amount;
    }
    return _expense;
  }
}

class _PieData {
  final String purpose;
  final double amount;
  final String text;

  _PieData({required this.purpose, required this.amount, required this.text});
}
