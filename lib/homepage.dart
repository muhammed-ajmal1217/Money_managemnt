import 'package:flutter/material.dart';
import 'package:myapp/custom_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
          height: 450,
          color: Color.fromARGB(255, 7, 1, 56),
          ),
         
    ),
    Positioned(
      top: 240,
      right: 20,
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 7, 72, 102),
        radius: 80,
      )),
        ],
      ),
    );
  }
}