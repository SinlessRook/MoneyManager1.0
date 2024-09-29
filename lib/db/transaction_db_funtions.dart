import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/model/transaction.dart/transaction.dart';

const Transction_Db_Name = "transaction_db";

abstract class TransactionDBFunctions {
  Future<List<TransactionModel>> getTransaction();
  Future<void> addTransaction(TransactionModel obj);
  Future<void> deleteTransaction(String id);
}

class TransactionDB extends TransactionDBFunctions {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifer =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>(Transction_Db_Name);
    await db.put(obj.transactionId, obj);
  }

  Future<void> refresh() async {
    final _list = await getTransaction();
    _list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifer.value.clear();
    transactionListNotifer.value.addAll(_list);
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    transactionListNotifer.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getTransaction() async {
    final _transactionDB =
        await Hive.openBox<TransactionModel>(Transction_Db_Name);
    return _transactionDB.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final _db = await Hive.openBox<TransactionModel>(Transction_Db_Name);
    await _db.delete(id);
    refresh();
  }
}
