import 'package:flutter/material.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AppBarShadows extends StatelessWidget {
  const AppBarShadows({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color:
            model.isDarkMode ? Colors.purple.shade700 : const Color(0xffF7F2F9),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            spreadRadius: 2,
            blurRadius: 2,
          )
        ],
      ),
    );
  }
}
