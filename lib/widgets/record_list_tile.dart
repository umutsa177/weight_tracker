import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/constant/consts.dart';
import 'package:weight_tracker/model/record.dart';
import 'package:weight_tracker/view_model/controller.dart';

class RecordListTile extends StatelessWidget {
  final Record record;

  RecordListTile({super.key, required this.record});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Constant.instance.borderRadiusCircular2x,
      ),
      child: Padding(
        padding: Constant.instance.topPadding + Constant.instance.bottomPadding,
        child: ListTile(
          leading: Text(DateFormat.yMMMMEEEEd().format(record.datetime)),
          title: Center(
            child: Text(
              "${record.weight}",
              style: TextStyle(
                fontSize: Constant.instance.textFontSize,
                fontStyle: Constant.instance.italic,
                fontWeight: Constant.instance.bold,
              ),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _editIconButton(),
              _deleteIconButton(),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _deleteIconButton() {
    return IconButton(
      onPressed: () {
        controller.deleteRecord(record);
      },
      icon: Icon(
        Icons.delete_outlined,
        color: Constant.instance.deleteIconColor,
      ),
    );
  }

  IconButton _editIconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.mode_edit_outline_outlined,
        color: Constant.instance.editIconColor,
      ),
    );
  }
}
