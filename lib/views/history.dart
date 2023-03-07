import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/constant/consts.dart';
import 'package:weight_tracker/model/record.dart';
import 'package:weight_tracker/view_model/controller.dart';
import 'package:weight_tracker/widgets/record_list_tile.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(Constant.instance.historyPageName),
          centerTitle: true,
          // //actions: [
          //   IconButton(
          //       onPressed: _controller.addRecord,
          //       icon: const Icon(Icons.add_outlined)),
          // ],
        ),
        body: records.isEmpty
            ? Center(
                child: _warningTextContainer(),
              )
            : ListView(
                physics: const BouncingScrollPhysics(),
                children: records
                    .map((record) => RecordListTile(record: record))
                    .toList(),
              ),
      ),
    );
  }

  Container _warningTextContainer() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: Constant.instance.borderRadiusCircularx,
          color: Constant.instance.containerColor,
        ),
        child: Text(
          Constant.instance.warningText,
          style: TextStyle(
            fontStyle: Constant.instance.italic,
            fontSize: Constant.instance.containertextFontSize,
          ),
        ));
  }
}
