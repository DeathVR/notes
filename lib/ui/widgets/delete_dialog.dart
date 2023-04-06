import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/router/app_routes.dart';
import 'package:notes/ui/style/app_colors.dart';

import 'package:notes/ui/widgets/Bottom_menu.dart';

import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final int index;
  const DeleteDialog({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return AlertDialog(
      title: const Text(
        'Удалить',
        style: TextStyle(
          fontSize: 24,
          height: 32 / 24,
          color: AppColors.primary,
        ),
      ),
      backgroundColor:
          model.isDarkMode ? Colors.purple.shade700 : AppColors.bgColor,
      content: Text(
        'Удалить заметку ${model.titleController.text}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          color: model.isDarkMode ? Colors.white70 : AppColors.secondary,
        ),
      ),
      actions: [
        DeleteDilogBtn(
          btnAction: () {
            Navigator.of(context).pop();
          },
          text: 'Отмена',
        ),
        DeleteDilogBtn(
          btnAction: () {
            model
                .deleteNote(index, context)
                .then((value) => Navigator.of(context).pop())
                .then((value) => Navigator.of(context).pop());
          },
          text: 'Удалить',
        ),
      ],
    );
  }
}

class DeleteDilogBtn extends StatelessWidget {
  final Function btnAction;
  final String text;
  const DeleteDilogBtn({Key? key, required this.btnAction, this.text = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return TextButton(
      onPressed: () => btnAction(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          color: model.isDarkMode ? Colors.white70 : const Color(0xff6750A4),
        ),
      ),
    );
  }
}

class ItemBottomMenuContent extends StatelessWidget {
  final int index;
  const ItemBottomMenuContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Column(
      children: [
        Container(
          width: 34,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: const Color(0xffDEDEDE),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          model.titleController.text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 19 / 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          model.noteController.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            height: 16 / 14,
            color: AppColors.primary,
          ),
        ),
        const Spacer(),
        BottomMenuBtn(
          icon: Icons.edit,
          text: 'Редактировать',
          btnAction: () {
            Navigator.of(context).pushNamed(AppRoutes.edit, arguments: index);
          },
        ),
        BottomMenuBtn(
          icon: Icons.backspace,
          text: 'Удалить',
          btnAction: () {
            showDialog(
              context: context,
              builder: (context) => DeleteDialog(
                index: index,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ItemBottomMenu extends StatelessWidget {
  final int index;
  const ItemBottomMenu({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Container(
      height: 179,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: model.isDarkMode ? Colors.purple.shade700 : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ItemBottomMenuContent(
        index: index,
      ),
    );
  }
}
