import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Constant {
  Constant._init();

  static Constant? _instance;

  static Constant get instance => _instance ??= Constant._init();

  // String

  final String appName = "Weight Tracker";

  final String buttonText = "Save Record";

  final String graphPageName = "Graph";

  final String historyPageName = "History";

  final String warningText = "Please add some records!";

  final String addRecordText = "Add New Record";

  final String inputLabelText = "Description";

  // Color

  final Color bgAppColor = Colors.black;

  final Color containerColor = Colors.lightGreen.shade100;

  final Color colorLine = Colors.blueAccent;

  final Color colorPoint = Colors.blue;

  final Color borderColor = Colors.grey;

  final Color labelColor = Colors.black54;

  final Color editIconColor = Colors.grey.shade600;

  final Color deleteIconColor = Colors.redAccent.shade700;

  final Color activeColor = Colors.greenAccent.shade400;

  final Color inactiveColor = Colors.grey;

  final Color animatedContainerColor = Colors.greenAccent;

  final Color statusBarColor = Colors.transparent;

  final Color onPrimary = Colors.white;

  final Color secondary = Colors.yellow;

  final Color onSecondary = Colors.brown;

  final Color error = Colors.redAccent;

  final Color onError = Colors.orange;

  final Color onBackground = Colors.blueGrey;

  final Color onSurface = Colors.black26;

  // AnimatedBottomNavigationBar Icons

  List<IconData> navigationBarIcons = [
    Icons.show_chart_outlined,
    Icons.history_outlined
  ];

  // GapLocation

  final GapLocation center = GapLocation.center;

  // FontStyle and FontWeight

  final FontStyle italic = FontStyle.italic;

  final FontWeight bold = FontWeight.bold;

  // BorderRadius

  final BorderRadius borderRadiusCircular2x = BorderRadius.circular(16);

  final BorderRadius borderRadiusCircularx = BorderRadius.circular(8);

  // Padding

  final EdgeInsets allPadding = const EdgeInsets.all(12.0);

  final EdgeInsets topPadding = const EdgeInsets.only(top: 10);

  final EdgeInsets bottomPadding = const EdgeInsets.only(bottom: 10);

  // Size

  final double textFontSize = 22;

  final double navigationHeight = Get.height / 11;

  final double navigationIconSize = 28;

  final double containertextFontSize = 32;

  final double iconSize = 40;

  final double chevronUpSize = 15;

  final double animatedContainerHeight = 10;

  final double radiusPoint = 2.5;

  final double minY = 45;

  final double maxY = 135;

  final double itemHeight = 55;

  final double itemWidth = 80;

  final int itemCount = 3;

  final int minValue = 45;

  final int maxValue = 135;

  final int step = 1;

  final int nbGradY = 10;

  // Duration

  final Duration year = const Duration(days: 365);

  final Duration month = const Duration(days: 30);

  final Duration second = const Duration(seconds: 1);

  // List

  final List<String> listGradX = [
    DateFormat.MMMMd().format(DateTime.now().subtract(const Duration(days: 5))),
    DateFormat.MMMMd().format(DateTime.now().subtract(const Duration(days: 4))),
    DateFormat.MMMMd().format(DateTime.now().subtract(const Duration(days: 3))),
    DateFormat.MMMMd().format(DateTime.now().subtract(const Duration(days: 2))),
    DateFormat.MMMMd().format(DateTime.now().subtract(const Duration(days: 1))),
  ];

  final List<num> nums = [65, 85, 55, 95, 120];
}
