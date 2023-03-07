import 'package:flutter/material.dart';
import 'package:graphic_representation/graphic_representation.dart';
import 'package:weight_tracker/constant/consts.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.instance.graphPageName),
        centerTitle: true,
      ),
      body: Center(
        child: _discreteGraphic(context),
      ),
    );
  }

  DiscreteGraphic _discreteGraphic(BuildContext context) {
    return DiscreteGraphic(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.6),
      nums: Constant.instance.nums,
      listGradX: Constant.instance.listGradX,
      colorAxes: Constant.instance.bgAppColor,
      colorLine: Constant.instance.colorLine,
      colorPoint: Constant.instance.colorPoint,
      radiusPoint: Constant.instance.radiusPoint,
      nbGradY: Constant.instance.nbGradY,
      minY: Constant.instance.minY,
      maxY: Constant.instance.maxY,
    );
  }
}
