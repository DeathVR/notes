import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';

import 'package:notes/ui/style/app_colors.dart';
import 'package:provider/provider.dart';

class ControlBtn extends StatelessWidget {
  final String text;
  final Function btnAction;
  const ControlBtn({super.key, required this.text, required this.btnAction});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return FloatingActionButton.extended(
      onPressed: () => btnAction(),
      backgroundColor:
          model.isDarkMode ? Colors.purple.shade700 : AppColors.bgColor,
      elevation: 2,
      highlightElevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 20 / 14,
          color: model.isDarkMode ? Colors.white70 : const Color(0xff6750A4),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
