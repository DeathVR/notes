import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/style/app_text_styles.dart';
import 'package:provider/provider.dart';

class ValueInput extends StatelessWidget {
  final String inputTitle;
  final TextEditingController controller;
  const ValueInput({
    super.key,
    this.inputTitle = 'Заголовок',
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return TextField(
      style: const TextStyle(
        color: Colors.white70,
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: AppTextStyles.valueInputBorder,
        enabledBorder: AppTextStyles.valueInputBorder,
        focusedBorder: AppTextStyles.valueInputBorder,
        hintText: inputTitle,
        hintStyle: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          color: model.isDarkMode ? Colors.white70 : AppColors.primary,
        ),
        label: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            inputTitle,
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              color: model.isDarkMode ? Colors.white70 : AppColors.secondary,
              backgroundColor: model.isDarkMode
                  ? Colors.grey.shade900
                  : const Color(0xffFFFBFE),
            ),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
