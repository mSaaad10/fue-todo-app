import 'package:flutter/material.dart';
import 'package:future_task_management_app/ui/home/tabs/settings_tab/settings_tab.dart';
import 'package:future_task_management_app/ui/home/tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (indexClicked) {
              selectedIndex = indexClicked;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings'),
            ],
          ),
        ),
        body: tabs[selectedIndex]);
  }

  var tabs = [
    TasksTab(),
    SettingsTab(),
  ];
}
