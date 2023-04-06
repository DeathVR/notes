import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'note_data.g.dart';

@HiveType(typeId: 0)
class NoteData {
  @HiveField(0)
  String title;

  @HiveField(1)
  String note;

  @HiveField(2)
  late String date;

  NoteData({required this.title, required this.note}) {
    DateTime nowTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(nowTime);
  }
}
