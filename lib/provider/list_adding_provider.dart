import 'package:flutter/material.dart';

class listAddingProvider extends ChangeNotifier{
  
  String dropdownValue = 'Income';
  List<String> items = ['Income', 'Expense'];
  listAdding(String? newValue){
    dropdownValue=newValue!;
    notifyListeners();
  }
}