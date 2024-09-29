import 'package:flutter/material.dart';
import 'package:money_manager/Screens/home.dart';

class MoneyManagementBottomNavigation extends StatefulWidget {
  const MoneyManagementBottomNavigation({super.key});

  @override
  State<MoneyManagementBottomNavigation> createState() =>
      _MoneyManagementBottomNavigationState();
}

class _MoneyManagementBottomNavigationState
    extends State<MoneyManagementBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectedindexnotifier,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return BottomNavigationBar(
            iconSize: 26,
            currentIndex: updatedindex,
            onTap: (newindex) {
              HomeScreen.selectedindexnotifier.value = newindex;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.analytics), label: "Analytics"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Transactions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Category"),
            ]);
      },
    );
  }
}
