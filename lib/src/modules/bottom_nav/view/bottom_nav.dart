import 'package:easy_do/src/modules/home_screen/view/home_view.dart';
import 'package:easy_do/src/modules/profile/view/profile_view.dart';
import 'package:easy_do/src/modules/task/view/task_view.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 80.0),
      //   child: FloatingActionButton.extended(
      //     backgroundColor: HexColor('#8C88CD'),
      //     onPressed: () {
      //       context.pushNamed(AppRoute.createTask.name);
      //     },
      //     label: const Text(
      //       'Add Task',
      //       style: TextStyle(color: Colors.white),
      //     ),
      //     icon: const Icon(
      //       Icons.add,
      //       size: 24,
      //       color: Colors.white,
      //     ),
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      //   ),
      // ),
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.home_outlined),
                      child: Text('Home'),
                    ),
                    Tab(
                        icon: Icon(Icons.insert_drive_file),
                        child: Text('Tasks')),
                    Tab(
                        icon: Icon(Icons.account_circle),
                        child: Text('Profile ')),
                  ],
                  labelColor: Color(0xff8c52ff),
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(color: Color(0xff8c52ff), width: 4.0),
                    insets: EdgeInsets.only(bottom: 74),
                  ),
                  unselectedLabelColor: Colors.grey,
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  HomeScreen(),
                  TaskView(),
                  ProfileView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
