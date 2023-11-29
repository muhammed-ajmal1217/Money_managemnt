import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/income.dart';
import 'package:myapp/provider/list_adding_provider.dart';
import 'package:myapp/widgets/drawe.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  String? amount;
  String? description;
  String? category;
  HomePage({Key? key,required this.amount,required this.description,required,this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.settings, 
                color: Color.fromARGB(255, 2, 1, 48), 
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: Consumer<listAddingProvider>(
        builder: (context,pro,child)=>
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Income : ${pro.totalIncome}/-',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 14)),),
                    Text('Expense : ${pro.totalExpense}/-',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 14)),),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final data= pro.items[index];
                  final textColor=data.category=='Income'? Colors.green:Colors.red;
                  return ListTile(
                    title: Text(data.description!),
                    subtitle: Text(data.category!),
                    trailing: data.amount != null ? Text('${data.amount}/-', style: TextStyle(fontSize: 16,color: textColor)) : null,
                    
                    
                  );
                  
                },
                itemCount: pro.items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
