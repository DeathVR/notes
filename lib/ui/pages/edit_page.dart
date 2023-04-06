import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/router/app_routes.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/style/app_text_styles.dart';
import 'package:notes/ui/widgets/Control_btn.dart';
import 'package:notes/ui/widgets/app_bar_shadows.dart';
import 'package:notes/ui/widgets/value_input.dart';
import 'package:provider/provider.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);

    final getIndex = ModalRoute.of(context)?.settings.arguments;
    final index = getIndex is int ? getIndex : 0;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadows(),
        centerTitle: true,
        title: const Text(
          'Изменить заметку',
          style: TextStyle(
            fontSize: 24,
            height: 28 / 22,
            color: AppColors.primary,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ValueInput(
            controller: model.titleController,
          ),
          const SizedBox(height: 16),
          ValueInput(
            controller: model.noteController,
            inputTitle: 'Заметки',
          ),
          const SizedBox(height: 26),
          ControlBtn(
            text: 'Изменить',
            btnAction: () {
              model.changeNoteData(index, context);
              Navigator.of(context).pushNamed(AppRoutes.home);
            },
          ),
        ],
      ),
    );
  }
}
