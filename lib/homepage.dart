import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/db_function/db_functions.dart';
import 'package:myapp/helpers/colors.dart';
import 'package:myapp/model/model.dart';
import 'package:myapp/widgets/drawe.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    refreshTasks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Transform.rotate(
                angle: 3 * (3.1415926535 / 180),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(255, 1, 4, 95).withOpacity(0.5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Transform.rotate(
                  angle: -2 * (3.1415926535 / 180),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 1, 0, 70)),
                    child: Transform.rotate(
                      angle: 0 * (3.1415926535 / 180),
                      child: Stack(
                        children: [
                          Container(
                            height: 140,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomRight: Radius.circular(150)),
                              gradient:mainContainerGradient()
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(150),bottomRight: Radius.circular(40)),
                                gradient: mainContainerGradient()
                              ),
                            ),
                          ),
                        ],
                      ),
        ),
                ),
              ),
          )],
          ),
          ValueListenableBuilder<List<Model>>(
            valueListenable: amountNotifier,
            builder: (BuildContext context, List<Model> items, Widget? child) {
              List<Model> reversedList=items.reversed.toList();
              print('Rebuilding with ${items.length} items');
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: reversedList.length,
                  itemBuilder: (context, index) {
                    final data = reversedList[index];
                    return ListTile(
                      title: Text(data.description!,style: GoogleFonts.karla(fontSize: 16,fontWeight: FontWeight.w600),),
                      subtitle: Text(data.category!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${data.category == 'Income' ? '+' '${data.amount}' : '-' '${data.amount}'}',
                            style: GoogleFonts.montserrat(
                                color: data.category == 'Income'
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                deleteListItem(data);
                                items.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
