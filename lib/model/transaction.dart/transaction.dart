import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/model/category/category.dart';
part 'transaction.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String purpose;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final CategoryType type;

  @HiveField(4)
  final CatecoryModel category;

  @HiveField(5)
  String? transactionId;

  TransactionModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  }) {
    transactionId = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
