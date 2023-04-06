import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/domain/hive/hive_keys.dart';
import 'package:notes/domain/hive/note_data.dart';
import 'package:notes/ui/app.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteDataAdapter());

  await Hive.openBox<NoteData>(HiveKeys.notesKey);

  // HiveBoxes.notes.clear();

  runApp(const NoteApp());
}
