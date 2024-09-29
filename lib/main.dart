import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/Screens/add_transaction.dart';
import 'package:money_manager/Screens/home.dart';
import 'package:money_manager/model/category/category.dart';

import 'model/transaction.dart/transaction.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CatecoryModelAdapter().typeId)) {
    Hive.registerAdapter(CatecoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          AddTransaction.routeName: (ctx) {
            return const AddTransaction();
          }
        },
        home: const HomeScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(247, 255, 255, 255),
          primaryColor: Colors.blue,
        ));
  }
}
