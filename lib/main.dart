import 'package:flutter/material.dart';
import 'package:myapp/bottom_bar.dart';
import 'package:myapp/provider/bottom_bar_provider.dart';
import 'package:myapp/provider/list_adding_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => listAddingProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigation()
      ),
    );
  }
}
