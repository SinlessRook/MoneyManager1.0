// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:money_manager/db/transaction_db_funtions.dart';
import 'package:money_manager/model/category/category.dart';
import 'package:money_manager/model/transaction.dart/transaction.dart';

ValueNotifier<List> basic_data_notifier = ValueNotifier([0, 0, 0]);
ValueNotifier<List<TransactionModel>> piechartnotifier = ValueNotifier([]);
ValueNotifier<List<TransactionModel>> advanced_data_notifier_income =
    ValueNotifier([]);
ValueNotifier<List<TransactionModel>> advanced_data_notifier_expense =
    ValueNotifier([]);
ValueNotifier<List<TransactionModel>> screenanalyticscategory_notifier =
    ValueNotifier([]);

abstract class ReportDbFunctions {
  Future<List<TransactionModel>> getdata_1(int obj);
  Future<void> application_data(int obj);
  Future<void> Get_basic_info(int obj);
  Future<void> Get_data_for_first_pie_chart(int obj);
  Future<void> Get_data_for_screenalalyticscategory(int obj, String category);
}

class ReportFunctions extends ReportDbFunctions {
  ReportFunctions._internal();
  static ReportFunctions instance = ReportFunctions._internal();
  factory ReportFunctions() {
    return instance;
  }

  Future<List<TransactionModel>> getdata_1(int obj) async {
    List<TransactionModel> _required_list = [];
    final _allTransactions = await TransactionDB.instance.getTransaction();
    final int _year = DateTime.now().year;
    if (obj == 0) {
      final _month = DateTime.now().month;
      for (var i = 0; i < _allTransactions.length; i++) {
        final _Transaction = _allTransactions[i];
        if (_Transaction.date.month == _month &&
            _Transaction.date.year == _year) {
          _required_list.add(_Transaction);
        }
      }
      return _required_list;
    }
    if (obj == 1) {
      final _month = DateTime.now().month;
      final _day = DateTime.now().day;
      for (var i = 0; i < _allTransactions.length; i++) {
        final _Transaction = _allTransactions[i];
        if (_Transaction.date.day == _day &&
            _Transaction.date.month == _month &&
            _Transaction.date.year == _year) {
          _required_list.add(_Transaction);
        }
      }
      return _required_list;
    }
    if (obj == 2) {
      double _month = DateTime.now().month - 1;
      if (_month == 0) {
        for (var i = 0; i < _allTransactions.length; i++) {
          final _Transaction = _allTransactions[i];
          if (_Transaction.date.month == 12 &&
              _Transaction.date.year == _year - 1) {
            _required_list.add(_Transaction);
          }
        }
        return _required_list;
      } else {
        for (var i = 0; i < _allTransactions.length; i++) {
          final _Transaction = _allTransactions[i];
          if (_Transaction.date.month == _month &&
              _Transaction.date.year == _year) {
            _required_list.add(_Transaction);
          }
        }
        return _required_list;
      }
    } else {
      return _allTransactions;
    }
  }

  Future<void> Get_basic_info(int obj) async {
    final data = await getdata_1(obj);
    double _expense = 0;
    double _income = 0;
    double _balance = 0;
    for (var i = 0; i < data.length; i++) {
      final _transaction = data[i];
      if (_transaction.type == CategoryType.income) {
        _income += _transaction.amount;
      } else {
        _expense += _transaction.amount;
      }
    }
    _balance = _income - _expense;
    final List<double> _lst = [_income, _expense, _balance];
    basic_data_notifier.value = _lst;
    basic_data_notifier.notifyListeners();
  }

  Future<void> Get_data_for_first_pie_chart(int obj) async {
    final _allTransaction = await getdata_1(obj);
    List<TransactionModel> _required_list = [];
    for (var i = 0; i < _allTransaction.length; i++) {
      if (_allTransaction[i].type == CategoryType.expense) {
        _required_list.add(_allTransaction[i]);
      }
    }
    piechartnotifier.value = _required_list;
    piechartnotifier.notifyListeners();
  }

  Future<void> application_data(int obj) async {
    final _allTransaction = await getdata_1(obj);
    List<TransactionModel> _income = [];
    List<TransactionModel> _expense = [];

    for (var i = 0; i < _allTransaction.length; i++) {
      final _Transaction = _allTransaction[i];
      if (_Transaction.type == CategoryType.income) {
        _income.add(_Transaction);
      } else {
        _expense.add(_Transaction);
      }
      _income.sort((first, second) => first.amount.compareTo(second.amount));
      _expense.sort((first, second) => first.amount.compareTo(second.amount));
    }
    advanced_data_notifier_income.value = _income;
    advanced_data_notifier_income.notifyListeners();
    advanced_data_notifier_expense.value = _expense;
    advanced_data_notifier_expense.notifyListeners();
  }

  Future<void> Get_data_for_screenalalyticscategory(
      int obj, String category) async {
    final _allTransaction = await getdata_1(obj);
    final List<TransactionModel> _required = [];
    for (var i = 0; i < _allTransaction.length; i++) {
      final _Transaction = _allTransaction[i];
      if (_Transaction.category.name == category) {
        _required.add(_Transaction);
      }
    }
    screenanalyticscategory_notifier.value = _required;
    screenanalyticscategory_notifier.notifyListeners();
  }
}
