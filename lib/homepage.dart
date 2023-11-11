import 'package:flutter/material.dart';
import 'package:myapp/widgets/drawe.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  List listItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 1, 48),
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                elevation: 5,
                
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 218, 218, 218),
                child: Container(
                  height: 230,
                  width: double.infinity,
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  
                );
              },
              itemCount: listItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
