import 'package:flutter/material.dart';
import 'package:money_manager/db/categories_db_functions.dart';
import 'package:money_manager/model/category/category.dart';

ValueNotifier<CategoryType> selectedcategorynotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopUp(BuildContext ctx) async {
  final _nameeditingcontroller = TextEditingController();
  showDialog(
      context: ctx,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleDialog(
            title: const Text("Add Category"),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameeditingcontroller,
                  decoration: const InputDecoration(
                      hintText: "Category Name", border: OutlineInputBorder()),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    RadioButton(title: 'Income', type: CategoryType.income),
                    RadioButton(title: "Expense", type: CategoryType.expense)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      final _name = _nameeditingcontroller.text;
                      if (_name.isEmpty) {
                        return;
                      } else {
                        final _value = selectedcategorynotifier.value;
                        final _category = CatecoryModel(
                            name: _name,
                            type: _value,
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString());
                        Categorydb.instance.insertcategory(_category);
                        Navigator.of(ctx).pop();
                      }
                    },
                    child: const Text("Add")),
              )
            ],
          ),
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedcategorynotifier,
            builder: (BuildContext ctx, CategoryType newcategory, Widget? _) {
              return Radio<CategoryType>(
                value: type,
                groupValue: selectedcategorynotifier.value,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  selectedcategorynotifier.value = value;
                  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                  selectedcategorynotifier.notifyListeners();
                },
              );
            }),
        Text(title)
      ],
    );
  }
}
