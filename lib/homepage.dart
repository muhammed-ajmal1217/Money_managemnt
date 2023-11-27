import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/widgets/drawe.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  List listItems = [];

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text('Amount : 3259/-',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 20)),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(''),
                  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
