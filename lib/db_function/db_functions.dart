import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/model/model.dart';
ValueNotifier<List<Model>> amountNotifier=ValueNotifier([]);
Future<List<Model>> getAllTasks() async {
  final amountBox = await Hive.openBox<Model>('amount_box');
  final List<Model> amountLists = amountBox.values.toList();
  return amountLists;
}

Future<void> addAmount(Model value) async {
  final amountBox = await Hive.openBox<Model>('amount_box');
  amountBox.add(value);
  amountNotifier.value.add(value);
  amountNotifier.notifyListeners();
  print('Data added successfully to Hive.');
}

Future<void> refreshTasks() async {
  final amountLists = await getAllTasks();
  amountNotifier.value = amountLists;
  amountNotifier.notifyListeners();
}
Future<void> deleteListItem(Model item) async {
  final amountBox = await Hive.openBox<Model>('amount_box');
  int reversedIndex = amountBox.values.toList().reversed.toList().indexOf(item);
  int originalIndex = amountBox.length - 1 - reversedIndex;
  amountBox.deleteAt(originalIndex);
  amountNotifier.notifyListeners();
  getAllTasks();
}







