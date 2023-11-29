import 'package:flutter/material.dart';
import 'package:myapp/model/model.dart';

class listAddingProvider extends ChangeNotifier{
  List<Model> items = [];
  String dropdownValue = 'Income';
  List<String> category = ['Income', 'Expense'];
    var totalIncome=0;
    var totalExpense=0;
  listAdding(String? newValue){
    dropdownValue=newValue!;
    notifyListeners();
  }

  void addItem(Model item) {
    items.add(item);
    notifyListeners();
  }
  void incomeExpense(){
        for(var datas in items){
      if(datas.category =='Income'){
        totalIncome+=datas.amount??0;
      }else if(datas.category=='Expense'){
        totalExpense+=datas.amount??0;
      }
    }
    notifyListeners();
  }
}