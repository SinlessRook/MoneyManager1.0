import 'package:hive_flutter/adapters.dart';
part 'category.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense
}

@HiveType(typeId: 1)
class CatecoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final CategoryType type;

  CatecoryModel(
      {required this.name,
      required this.type,
      required this.id,
      this.isDeleted = false});
}
