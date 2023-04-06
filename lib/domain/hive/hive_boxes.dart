import 'package:hive/hive.dart';
import 'package:notes/domain/hive/hive_keys.dart';
import 'package:notes/domain/hive/note_data.dart';

class HiveBoxes {
  static final Box<NoteData> notes = Hive.box<NoteData>(HiveKeys.notesKey);
}
