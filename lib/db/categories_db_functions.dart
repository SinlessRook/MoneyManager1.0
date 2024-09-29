// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/model/category/category.dart';

const categorydatabasename = "CategoryDatabase";

abstract class Categorydbfunctions {
  Future<List<CatecoryModel>> getcategory();
  Future<void> insertcategory(CatecoryModel value);
  Future<void> deletecategory(String categoryID);
}

class Categorydb implements Categorydbfunctions {
  Categorydb._internal();
  static Categorydb instance = Categorydb._internal();
  factory Categorydb() {
    return instance;
  }

  ValueNotifier<List<CatecoryModel>> incomecategorynotifier = ValueNotifier([]);
  ValueNotifier<List<CatecoryModel>> expensecategorynotifier =
      ValueNotifier([]);
  @override
  Future<void> insertcategory(CatecoryModel value) async {
    final _categorydb = await Hive.openBox<CatecoryModel>(categorydatabasename);
    await _categorydb.put(value.id, value);
    refreshUI();
  }

  @override
  Future<List<CatecoryModel>> getcategory() async {
    final _categorydb = await Hive.openBox<CatecoryModel>(categorydatabasename);
    return _categorydb.values.toList();
  }

  Future<void> refreshUI() async {
    final _allcategories = await getcategory();
    incomecategorynotifier.value.clear();
    expensecategorynotifier.value.clear();
    await Future.forEach(_allcategories, (CatecoryModel category) {
      if (category.type == CategoryType.income) {
        incomecategorynotifier.value.add(category);
      } else {
        expensecategorynotifier.value.add(category);
      }
    });
    incomecategorynotifier.notifyListeners();
    expensecategorynotifier.notifyListeners();
  }

  @override
  Future<void> deletecategory(String categoryID) async {
    final _categorydb = await Hive.openBox<CatecoryModel>(categorydatabasename);
    await _categorydb.delete(categoryID);
    refreshUI();
  }
}
