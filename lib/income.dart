import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/db_function/db_functions.dart';
import 'package:myapp/model/model.dart';

class inCome extends StatelessWidget {
  const inCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: amountNotifier,
        builder: 
      (BuildContext context, List<Model> amountNotifier , Widget? child) {
        List<Model> incomeList = amountNotifier.where((data) => data.category == "Income").toList();
         return ListView.separated(itemBuilder: (context, index) {
          final data=incomeList[index];
            return  ListTile(
              title: Text(data.description!),
              subtitle: Text(data.category!),
              trailing: Text('+${data.amount}',style: GoogleFonts.montserrat(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w700),),
            );
          },
           separatorBuilder: (context, index) => Divider(), 
           itemCount: incomeList.length);
      },
      ),
    );
  }
}