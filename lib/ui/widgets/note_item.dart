import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/style/app_text_styles.dart';
import 'package:notes/ui/widgets/delete_dialog.dart';

import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  final String title;
  final String date;
  final String note;
  const Content({
    super.key,
    this.title = 'title',
    this.date = '27.11.2022',
    this.note = 'note',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.contentTitleStyle,
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: const TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: Color(0xffCAC4D0),
          ),
        ),
        const SizedBox(height: 9),
        Text(
          note,
          style: AppTextStyles.contentTextStyle,
        ),
      ],
    );
  }
}

class NoteItem extends StatelessWidget {
  final String title;
  final String date;
  final String note;
  final int index;
  const NoteItem({
    super.key,
    required this.title,
    required this.date,
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Dismissible(
      onDismissed: (direction) => model.deleteNote(index, context),
      key: UniqueKey(),
      child: GestureDetector(
        onTap: () {
          model.setController(index);
          showModalBottomSheet(
            context: context,
            builder: (context) => ItemBottomMenu(
              index: index,
            ),
            backgroundColor: Colors.transparent,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            minHeight: 117,
          ),
          decoration: BoxDecoration(
            color:
                model.isDarkMode ? Colors.purple.shade700 : AppColors.bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .3),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Content(
            title: title,
            date: date,
            note: note,
          ),
        ),
      ),
    );
  }
}
