import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:weight_tracker/constant/consts.dart';
import 'package:weight_tracker/view_model/controller.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  num _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _controller = TextEditingController();
  final _key = GlobalKey();
  late String description;
  final Controller controller = Get.find();

  void pickDate(BuildContext context) async {
    DateTime initialdate = DateTime.now();
    _selectedDate = await showDatePicker(
            context: context,
            initialDate: initialdate,
            firstDate: initialdate.subtract(Constant.instance.year),
            lastDate: initialdate.add(Constant.instance.month),
            builder: (context, child) {
              return Theme(
                  data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary: Constant.instance.bgAppColor,
                    onPrimary: Constant.instance.onPrimary,
                    secondary: Constant.instance.secondary,
                    onSecondary: Constant.instance.onSecondary,
                    error: Colors.redAccent,
                    onError: Constant.instance.onError,
                    background: Constant.instance.colorLine,
                    onBackground: Constant.instance.onBackground,
                    surface: Constant.instance.colorPoint,
                    onSurface: Constant.instance.onSurface,
                  )),
                  child: child ?? const Text(""));
            }) ??
        _selectedDate;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.instance.addRecordText),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _selectedWeightCard(),
          Padding(
            padding: Constant.instance.allPadding,
            child: InkWell(
              onTap: () {
                pickDate(context);
              },
              child: _selectedDateCard(),
            ),
          ),
          _descriptionCard(),
          _saveRecordButton(),
        ],
      ),
    );
  }

  ElevatedButton _saveRecordButton() {
    return ElevatedButton(
      onPressed: () {
        controller.newRecord(
            _selectedValue.toDouble(), _selectedDate, description);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Constant.instance.bgAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: Constant.instance.borderRadiusCircular2x,
        ),
      ),
      child: Padding(
        padding: Constant.instance.allPadding,
        child: Text(Constant.instance.buttonText),
      ),
    );
  }

  Card _descriptionCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Constant.instance.borderRadiusCircular2x,
      ),
      child: Padding(
        padding: Constant.instance.allPadding,
        child: TextField(
            controller: _controller,
            onTap: () {
              description = _controller.text.toString();
            },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: Constant.instance.inputLabelText,
              border: const OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Constant.instance.labelColor,
                fontStyle: FontStyle.italic,
                fontSize: Constant.instance.textFontSize,
              ),
            ),
            buildCounter: (context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return AnimatedContainer(
                key: _key,
                duration: Constant.instance.second,
                height: Constant.instance.animatedContainerHeight,
                width: Constant.instance.animatedContainerHeight *
                    (currentLength ?? 0),
                color: Constant.instance.animatedContainerColor,
              );
            }),
      ),
    );
  }

  Card _selectedDateCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Constant.instance.borderRadiusCircular2x,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            FontAwesomeIcons.calendar,
            size: Constant.instance.iconSize,
          ),
          Expanded(
            child: Text(
              DateFormat.yMMMMEEEEd().format(_selectedDate),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Card _selectedWeightCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: Constant.instance.borderRadiusCircular2x,
      ),
      child: Padding(
        padding: Constant.instance.allPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              (FontAwesomeIcons.weightScale),
              size: Constant.instance.iconSize,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Icon(
                  FontAwesomeIcons.chevronUp,
                  size: Constant.instance.chevronUpSize,
                ),
                _numberPicker(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  NumberPicker _numberPicker() {
    return NumberPicker(
      axis: Axis.horizontal,
      step: Constant.instance.step,
      itemCount: Constant.instance.itemCount,
      itemHeight: Constant.instance.itemHeight,
      itemWidth: Constant.instance.itemWidth,
      minValue: Constant.instance.minValue,
      maxValue: Constant.instance.maxValue,
      value: _selectedValue.toInt(),
      onChanged: (value) => setState(() => _selectedValue = value),
      decoration: BoxDecoration(
        borderRadius: Constant.instance.borderRadiusCircularx,
        border: Border.all(color: Constant.instance.borderColor),
      ),
    );
  }
}
