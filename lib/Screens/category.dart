import 'package:flutter/material.dart';
import 'package:money_manager/db/categories_db_functions.dart';
import 'package:money_manager/widgets/Expense_list_view.dart';
import 'package:money_manager/widgets/income_list_view.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    Categorydb().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(text: 'INCOME'),
              Tab(
                text: "EXPENSE",
              )
            ]),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          IncomeListView(),
          Expenselistview(),
        ]))
      ],
    );
  }
}
