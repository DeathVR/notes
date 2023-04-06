import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:provider/provider.dart';

class BottomMenuBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function btnAction;
  const BottomMenuBtn(
      {super.key,
      required this.icon,
      required this.text,
      required this.btnAction});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () => btnAction(),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              model.isDarkMode ? Colors.transparent : AppColors.bgColor),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
            ),
            const SizedBox(width: 19),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                height: 24 / 16,
                color: model.isDarkMode ? Colors.white70 : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
