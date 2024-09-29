import 'package:flutter/material.dart';
import 'package:money_manager/Screens/Add_Transaction.dart';
import 'package:money_manager/Screens/Report.dart';
import 'package:money_manager/Screens/Transaction.dart';
import 'package:money_manager/Screens/category.dart';
import 'package:money_manager/widgets/category_get_info.dart';

import '../widgets/notification_bar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final _pages = const [
    ScreenAnalytics(),
    ScreenTransaction(),
    ScreenCategory()
  ];
  static ValueNotifier<int> selectedindexnotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Money Management"),
            ),
            bottomNavigationBar: const MoneyManagementBottomNavigation(),
            body: ValueListenableBuilder(
              valueListenable: selectedindexnotifier,
              builder: (context, updatedindex, _) {
                return _pages[updatedindex];
              },
            ),
            floatingActionButton: ValueListenableBuilder(
              valueListenable: selectedindexnotifier,
              builder: (context, updatedindex, child) {
                if (updatedindex == 1 || updatedindex == 2) {
                  return FloatingActionButton(
                    onPressed: () {
                      if (selectedindexnotifier.value == 1) {
                        Navigator.of(context)
                            .pushNamed(AddTransaction.routeName);
                      }
                      if (selectedindexnotifier.value == 2) {
                        showCategoryAddPopUp(context);
                      } else {}
                    },
                    child: const Icon(Icons.add),
                  );
                } else {
                  return const Text(""); //To be edited later
                }
              },
            )));
  }
}
