import 'package:flutter/material.dart';
import 'package:notes/domain/hive/hive_boxes.dart';
import 'package:notes/domain/hive/note_data.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/style/app_text_styles.dart';

class NoteProvider extends ChangeNotifier {
  //контролеры для получения данных с текстовых полей
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  bool isDarkMode = false;

  void addNote(BuildContext context) async {
    await HiveBoxes.notes
        .add(
          NoteData(
            title: titleController.text.isEmpty
                ? 'Нет заголовка'
                : titleController.text,
            note: noteController.text.isEmpty
                ? 'Нет заметки'
                : noteController.text,
          ),
        )
        .then((value) => Navigator.of(context).pop())
        .then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.bgColor,
              content: Text(
                'Заметка добавлена',
                style: const TextStyle(
                  fontSize: 24,
                  height: 28 / 22,
                  color: AppColors.primary,
                ).copyWith(fontSize: 16),
              ),
            ),
          ),
        );

    clearControllers();
  }

  void clearControllers() {
    titleController.clear();
    noteController.clear();
  }

  Future<void> deleteNote(int index, BuildContext context) async {
    await HiveBoxes.notes.deleteAt(index);
    // .then((value) => Navigator.of(context).pop());
  }

  void changeNoteData(int index, BuildContext context) {
    HiveBoxes.notes.putAt(
      index,
      NoteData(
        title: titleController.text,
        note: noteController.text,
      ),
    );
  }

  void setController(int index) {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? '';
    noteController.text = HiveBoxes.notes.getAt(index)?.note ?? '';
  }

  void darkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
