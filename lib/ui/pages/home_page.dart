import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/domain/hive/providers/note_provider.dart';
import 'package:notes/ui/router/app_routes.dart';
import 'package:notes/ui/style/app_colors.dart';
import 'package:notes/ui/widgets/Node_list.dart';
import 'package:notes/ui/widgets/app_bar_shadows.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      floatingActionButton: const HomePageAddBtn(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarShadows(),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                model.darkMode();
              },
              icon: Icon(
                  model.isDarkMode ? Icons.sunny : Icons.dark_mode_outlined),
              color: AppColors.primary,
            ),
            Text(
              'Заметки',
              style: TextStyle(
                fontSize: 22,
                height: 28,
                color: model.isDarkMode ? Colors.white70 : Colors.black,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.search);
                },
                iconSize: 24,
                splashRadius: 24,
                icon: const Icon(Icons.search),
                color: AppColors.primary),
          ],
        ),
      ),
      body: const NodeList(),
    );
  }
}

class HomePageAddBtn extends StatelessWidget {
  const HomePageAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return FloatingActionButton(
      onPressed: () {
        model.clearControllers();
        Navigator.of(context).pushNamed(AppRoutes.add);
      },
      elevation: 2,
      highlightElevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor:
          model.isDarkMode ? Colors.purple.shade700 : AppColors.bgColor,
      child: SvgPicture.asset(
        'assets/icons/icon.svg',
        color: model.isDarkMode ? Colors.white70 : null,
      ),
    );
  }
}
