import 'package:easy_do/src/modules/home_screen/view/home_view.dart';
import 'package:easy_do/src/modules/profile/view/profile_view.dart';
import 'package:easy_do/src/modules/task/view/task_view.dart';
import 'package:easy_do/src/routing/app_route.dart';
import 'package:easy_do/src/utils/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 15),
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
