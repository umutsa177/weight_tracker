import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/constant/consts.dart';
import 'package:weight_tracker/view_model/controller.dart';
import 'package:weight_tracker/views/add_record.dart';
import 'package:weight_tracker/views/graph.dart';
import 'package:weight_tracker/views/history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(Controller());

  int _selectedTab = 0;

  Widget _selectedScreen = const History();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(child: Text("Weight Tracker")),
      // ),
      body: _selectedScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddRecord());
        },
        backgroundColor: Constant.instance.bgAppColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _animatedBottomNavigationBar(),
    );
  }

  AnimatedBottomNavigationBar _animatedBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
        height: Constant.instance.navigationHeight,
        activeColor: Constant.instance.activeColor,
        inactiveColor: Constant.instance.inactiveColor,
        gapLocation: Constant.instance.center,
        icons: Constant.instance.navigationBarIcons,
        iconSize: Constant.instance.navigationIconSize,
        activeIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
            _selectedScreen = (index == 0) ? const Graph() : const History();
          });
        });
  }
}
