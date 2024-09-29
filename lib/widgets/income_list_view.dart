import 'package:flutter/material.dart';
import 'package:money_manager/db/categories_db_functions.dart';

class IncomeListView extends StatelessWidget {
  const IncomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Categorydb().incomecategorynotifier,
        builder: (ctx, newlist, _) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final category = newlist[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Categorydb.instance.deletecategory(category.id);
                        },
                      ),
                      title: Text(category.name)),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
