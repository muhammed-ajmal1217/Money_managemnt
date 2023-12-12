import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/db_function/db_functions.dart';
import 'package:myapp/model/model.dart';

class exPense extends StatelessWidget {
  const exPense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(valueListenable: amountNotifier, 
            builder: (BuildContext context, List<Model> amountList, Widget? child) {
              List<Model> expenseList=amountList.where((exPense) => exPense.category=="Expense").toList();
              return ListView.separated(
                itemBuilder:(context, index) {
                  final expense=expenseList[index];
                  return ListTile(
                    title: Text(expense.description!),
                    subtitle: Text(expense.category!),
                    trailing: Text('-${expense.amount}',style: GoogleFonts.montserrat(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w700),),
                  );
                }, 
                separatorBuilder: (context, index) => Divider(), 
                itemCount: expenseList.length);
            },),
          )
        ],
      ),
    );
  }
}