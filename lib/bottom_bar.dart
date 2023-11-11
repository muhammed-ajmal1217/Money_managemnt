import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/chart.dart';
import 'package:myapp/controller/list_adding_widget.dart';
import 'package:myapp/expense.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/income.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  TextEditingController descriptionController = TextEditingController();
  int selectIndex = 0;
  List<Widget> widgetOptions = [];
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    widgetOptions = [
      HomePage(),
      const inCome(),
      const exPense(),
      const Chart(),
    ];
    currentScreen = widgetOptions[selectIndex];
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: PageStorage(
              bucket: bucket,
              child: currentScreen,
            ),
            
            bottomNavigationBar: Theme(
               data: Theme.of(context).copyWith(
              canvasColor: Color.fromARGB(255, 2, 1, 48), 
            ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BottomNavigationBar(
                    elevation: 4,
                    currentIndex: selectIndex,
                    onTap: (int index) {
                      setState(() {
                        selectIndex = index;
                        currentScreen = widgetOptions[index];
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.task_alt_outlined),
                        label: 'Complete',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.rule),
                        label: 'Incomplete',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.leaderboard_outlined),
                        label: 'Chart',
                      ),
                    ],
                    selectedItemColor: Color.fromARGB(255, 207, 95, 4),
                    unselectedItemColor: Colors.white,
                    selectedLabelStyle: TextStyle(fontSize: 16),
                    unselectedLabelStyle: TextStyle(fontSize: 16),
                    selectedFontSize: 16,
                    unselectedFontSize: 16,
                    selectedIconTheme: IconThemeData(size: 24),
                    unselectedIconTheme: IconThemeData(size: 24),
                  ),
                ),
              ),
            ),
            floatingActionButton: ListAdding(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        );
      }
    );
  }
}
