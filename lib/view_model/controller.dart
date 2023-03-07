import 'package:get/get.dart';

import '../model/record.dart';

class Controller extends GetxController {
  RxList<Record> records = <Record>[].obs;

  // For example //
  void addRecord() {
    records.add(Record(
      weight: 85,
      datetime: DateTime.now(),
      description: "QWER",
    ));
  }

  // For delete //

  void deleteRecord(Record record) {
    records.remove(record);
  }

  // For add //

  void newRecord(double weight, DateTime datetime, String? description) {
    records.add(Record(
      weight: weight,
      datetime: datetime,
      description: description,
    ));
  }
}
