import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/style/app_colors.dart';

import 'package:notes/ui/widgets/Control_btn.dart';
import 'package:notes/ui/widgets/app_bar_shadows.dart';
import 'package:notes/ui/widgets/value_input.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarShadows(),
        centerTitle: true,
        title: const Text(
          'Добавить заметку',
          style: TextStyle(
            fontSize: 24,
            height: 28 / 22,
            color: AppColors.primary,
          ),
        ),
      ),
      body: const AddNotePage(),
    );
  }
}

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return ListView(
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
          text: 'Добавить',
          btnAction: () => model.addNote(context),
        ),
      ],
    );
  }
}
