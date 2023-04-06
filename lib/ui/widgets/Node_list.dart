import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/domain/hive/hive_boxes.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';

import 'package:notes/ui/widgets/note_item.dart';
import 'package:provider/provider.dart';

class NodeList extends StatelessWidget {
  const NodeList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return ValueListenableBuilder(
      valueListenable: HiveBoxes.notes.listenable(),
      builder: (context, notes, _) {
        final allNotes = notes.values.toList();

        return allNotes.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => NoteItem(
                  title: allNotes[index].title,
                  date: allNotes[index].date,
                  note: allNotes[index].note,
                  index: index,
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 0),
                itemCount: allNotes.length,
              )
            : Center(
                child: Text(
                  'Нет заметок',
                  style: TextStyle(
                    fontSize: 24,
                    height: 28 / 22,
                    color:
                        model.isDarkMode ? Colors.white70 : AppColors.primary,
                  ),
                ),
              );
      },
    );
  }
}
